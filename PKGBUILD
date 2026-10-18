# Maintainer: DecDuck <declanahofmeyr@gmail.com>
# Maintainer: quexeky <git@quexeky.dev>

pkgname=drop-oss-app-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="The client application for the open-source, self-hosted game distribution platform Drop"
arch=(any)
conflicts=('drop-oss-app')
url="https://droposs.org/"
license=('LicenseRef-GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs' 'webkit2gtk-4.1' 'umu-launcher' 'libappindicator' 'libayatana-appindicator')
makedepends=('libarchive')
source=("https://github.com/Drop-OSS/drop/releases/download/v0.4.0-rc-6/Drop.Desktop.Client_0.4.0_amd64.deb")
sha256sums=('2a0941263a06162868045ed51476b4cf6cc8a67337368cedc293df58ece20807')

prepare() {
	bsdtar -xf ./*.deb
	bsdtar -xf data.tar.*
}

package() {
	cp -r "$srcdir/usr" "$pkgdir"
}
