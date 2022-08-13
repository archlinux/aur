# Maintainer: LanjieYou <ylj18926385312@163.com>
pkgname='brain-fuck'
pkgver=1.2
pkgrel=1
epoch=0
pkgdesc="brain语言解释器(Chinese Only)"
arch=('x86_64')
url="https://github.com/youlanjie/Brain-Fuck"
license=('MIT')
groups=()
depends=('glibc')
makedepends=('git' 'gcc' 'make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/youlanjie/Brain-Fuck.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -D -m=0755 "bin/main" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m=0644 "res/${pkgname}.svg" "${pkgdir}/usr/share/icons/${pkgname}.svg"
	install -D -m=0644 "res/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m=0644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
