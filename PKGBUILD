# Maintainer: Ckat <ckat@yandex.ru>

pkgname=intel-sof-bin
pkgver=2024.06
pkgrel=1
pkgdesc="SOF Project - Firmware and topology binaries"
arch=('any')
license=('GPL')
depends=('linux-firmware')
url="https://github.com/thesofproject/sof-bin"
source=("sof-bin-$pkgver.tar.gz::https://github.com/thesofproject/sof-bin/releases/download/v$pkgver/sof-bin-$pkgver.tar.gz")
md5sums=('18e49a2222b1c81c1b6b12c937b0f67d')

package() {
    cd "${srcdir}/sof-bin-$pkgver"

    for i in sof/*.*; do
		install -Dm 644 $i "$pkgdir/lib/firmware/intel/$i"
    done
    for i in tools/*; do
		install -Dm 755 $i "$pkgdir/usr/bin/$i"
    done
}
