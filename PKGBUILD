# Maintainer: Barfin
pkgname=windows95-electron-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="This is Windows 95, running in an Electron app. Yes, it's the full thing. I'm sorry."
arch=(x86_64)
url="https://github.com/felixrieseberg/windows95"
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux' 'kde-cli-tools' 'glib2' 'gvfs' 'pulseaudio' 'alsa-lib')
license=(custom)
makedepends=(wget)
source=("${url}/releases/download/v${pkgver}/windows95-linux-${pkgver}_amd64.deb")

package() {
	wget -nc "${url}/releases/download/v${pkgver}/windows95-linux-${pkgver}_amd64.deb"
	ar vx "windows95-linux-${pkgver}_amd64.deb"
	tar -xvf data.tar.xz
	cd usr
	mkdir -p ${pkgdir}/usr
	mv * ${pkgdir}/usr

}
md5sums=('a748876a2dd5f590d687f16c637f7731')
