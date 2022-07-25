# Maintainer=yuh <yuhldr@qq.com>

pkgdata=ldr-translate
pkgname=$pkgdata-qt
pkgver=1.5.0
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
md5sums=(c4c894d9da1f87cd4344d61d9d11c1c9)
validpgpkeys=()

prepare() {
	cd "$pkgdata-$pkgver"
	echo "ldr"
}

package() {
	cd "$pkgdata-$pkgver"

	sudo mkdir -p /usr/bin
	sudo mkdir -p /usr/share/applications
	sudo mkdir -p /usr/share/icons
	sudo mkdir -p /opt/ldr-translate

	sudo cp data/ldr /usr/bin/

	sudo cp data/icon/icon.png /usr/share/icons/ldr-translate.png
	sudo cp data/ldr-translate.desktop /usr/share/applications/

	sudo cp -r api data/icon data/config.json data/config_locale.json /opt/ldr-translate/
	sudo cp gui/qt/* /opt/ldr-translate/
}
