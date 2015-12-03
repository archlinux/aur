# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=acarsdec
pkgver=3.2
pkgrel=1
pkgdesc="Multi-channel ACARS decoder for rtl_sdr"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/acarsdec/"
license=('GPL')
depends=('rtl-sdr' 'alsa-lib' 'sqlite')
source=("http://downloads.sourceforge.net/project/acarsdec/acarsdec/$pkgver/acarsdec-$pkgver.tar.gz")
sha256sums=('579a63f4f68618aee7de04e3ea1081ec7bd0f0853ea0debc3080a23f9b8f4a9f')

build() {
    cd "$pkgname-$pkgver"
    make
    make acarsserv
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm 0755 acarsdec ${pkgdir}/usr/bin/acarsdec
    install -Dm 0755 acarsserv ${pkgdir}/usr/bin/acarsserv
}
