# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: kalew515 <youremail@domain.com>
pkgname=fast-translate
pkgver=1.2.2
pkgrel=1
epoch=
pkgdesc="一款适用于Linux系统的翻译软件，支持选中即翻译，方便文献阅读等"
arch=('x86_64')
url="https://github.com/KaleW515/fast-translate"
license=('MIT')
groups=(fast-translate)
depends=(make python python-pip)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/kalew515/$pkgname/archive/refs/tags/$pkgver.tar.gz")
noextract=()
md5sums=('c3c6f8fb89d5200a983acc2c477d4032')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	pip3 install -r requirements.txt
}

build() {
	cd "$pkgname-$pkgver"
	install -vd build/${pkgname}/usr/bin
	install -vd build/${pkgname}/usr/share/applications
	install -vd build/${pkgname}/usr/share/icons
	install -vd build/${pkgname}/opt/${pkgname}
	cp -r pkg/aur/ftranslate build/${pkgname}/usr/bin/
	cp -r src/data/icon/logo.svg.png build/${pkgname}/usr/share/icons/fast-translate.png
	cp -r pkg/aur/fast-translate.desktop build/${pkgname}/usr/share/applications/
	cp -r src/* build/${pkgname}/opt/${pkgname}/
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	mkdir ${pkgdir}/opt/
	mkdir ${pkgdir}/usr/
	cp -r build/${pkgname}/opt/${pkgname}/ ${pkgdir}/opt/
	cp -r build/${pkgname}/usr/* ${pkgdir}/usr/
}

 
