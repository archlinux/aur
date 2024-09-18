# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=pinokio-bin
pkgver=2.15.1
pkgrel=1
pkgdesc='AI Browser.'
arch=('x86_64' 'aarch64')
url='https://github.com/pinokiocomputer/pinokio'
license=('MIT')
depends=('gtk3' 'libnotify' 'libnss_nis' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3')
makedepends=('binutils' 'tar')
provides=('pinokio')
conflicts=('pinokio')
source_x86_64=("$url/releases/download/$pkgver/Pinokio_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/$pkgver/Pinokio_${pkgver}_arm64.deb")

sha256sums_x86_64=('2c319bd7cf4cd9200c1619431d2d0be739f4c14f44094abc0d685728d1877a0e')
sha256sums_aarch64=('231f1dde32889043aa26bcb56e2238b9ad4be4127690f7d0eb85169d5cf426e6')

prepare() {
#        ar x "Pinokio_${pkgver}_$CARCH.deb"
        ar x Pinokio_${pkgver}_amd64.deb
	tar xf data.tar.xz
}

package() {
	install -D "$srcdir/usr/share/icons/hicolor/0x0/apps/pinokio.png" "$pkgdir/usr/share/icons/hicolor/0x0/apps/pinokio.png"
	install -D "$srcdir/usr/share/applications/pinokio.desktop" "$pkgdir/usr/share/applications/pinokio.desktop"
	install -D "$srcdir/usr/share/doc/pinokio/changelog.gz" "$pkgdir/usr/share/doc/pinokio/changelog.gz"
	install -d "$pkgdir/opt/Pinokio"
	cp -r "$srcdir/opt/Pinokio" "$pkgdir/opt/"
#	install -m644 "$srcdir/opt/Pinokio" "$pkgdir/opt/Pinokio/"
}
