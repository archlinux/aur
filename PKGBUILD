# Maintainer: DecDuck <declanahofmeyr@gmail.com>
# Maintainer: quexeky <git@quexeky.dev>

pkgname=drop-oss-app-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="The client application for the open-source, self-hosted game distribution platform Drop"
arch=('x86_64')
conflicts=('drop-oss-app')
url="https://droposs.org/"
license=('LicenseRef-GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs' 'webkit2gtk-4.1' 'umu-launcher' 'libappindicator' 'libayatana-appindicator')
makedepends=('libarchive')
options=('!strip' '!debug')
source=("https://github.com/Drop-OSS/drop/releases/download/v0.4.0-test-flatpak-2/Drop.Desktop.Client_0.4.0_amd64.deb")
sha256sums=('6a3ec8e4d4225cc6c93d34886aacf4f24b004067eea56f0b5c73ba93a26be1fd')

prepare() {
	bsdtar -xf ./*.deb
	bsdtar -xf data.tar.*
}

package() {
	cp -r "$srcdir/usr" "$pkgdir"
}
