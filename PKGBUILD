# Maintainer=yuh <yuhldr@qq.com>

pkgdata=ldr-translate
pkgname=$pkgdata-qt
pkgver=1.6.0
pkgrel=1
epoch=
pkgdesc="一个翻译软件，更适合kde桌面，专注文献翻译，可以截图翻译、复制翻译"
arch=('x86_64')
url="https://github.com/yuhldr/$pkgdata"
license=('GPL')
groups=(ldr)
depends=(python python-requests python-pyqt5)
checkdepends=()
optdepends=()
provides=()
conflicts=($pkgdata-gtk)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/yuhldr/$pkgdata/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=(cd202cf24ae6ea7270f6c3546b5e033f)
validpgpkeys=()

prepare() {
	cd "$pkgdata-$pkgver"
	echo "ldr"
}

package() {
	cd "$pkgdata-$pkgver"

	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/applications
	mkdir -p "$pkgdir"/usr/share/icons
	mkdir -p "$pkgdir"/opt/ldr-translate

	cp data/ldr "$pkgdir"/usr/bin/

	cp data/icon/icon.png "$pkgdir"/usr/share/icons/ldr-translate.png
	cp data/ldr-translate.desktop "$pkgdir"/usr/share/applications/

	cp -r utils api data/icon data/config.json data/version.json data/locales "$pkgdir"/opt/ldr-translate/
	cp gui/qt/* "$pkgdir"/opt/ldr-translate/
}
