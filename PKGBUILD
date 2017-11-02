# Maintainer: 0x9fff00 <0x9fff00@gmail.com>
# Contributor: Benjamin ROBIN <dev@benjarobin.fr>
pkgname=mt7630-pcie-wifi-dkms
pkgver=2.1.0
pkgrel=1
epoch=1
_commit=096b17e82c8ccf3c577638a3f773490bf3ec90ea
pkgdesc="MT7630e PCIe Wifi (DKMS)"
arch=('i686' 'x86_64')
url="http://www.mediatek.com/en/downloads/mt7630-pcie/"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: If running standard kernel, otherwise find matching headers for your kernel')
source=("https://github.com/neurobin/MT7630E/archive/${_commit}.tar.gz")
md5sums=('681c6059c313376fae0be59b49472ed9')

package() {
    cd "MT7630E-${_commit}"
    mkdir -p "${pkgdir}/usr/src/mt7630e-${pkgver}"
    cp -a * "${pkgdir}/usr/src/mt7630e-${pkgver}"
    install -D -m644 "firmware/BT/mt76x0.bin" "${pkgdir}/usr/lib/firmware/mt76x0.bin"
    install -D -m644 "firmware/Wi-FI/MT7650E234.bin" "${pkgdir}/usr/lib/firmware/MT7650E234.bin"
}

