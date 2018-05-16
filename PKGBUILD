# Maintainer Carmelo12341 <carmelo12341 at disroot dot com>

pkgname=akasha-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A Next-Generation Social Media Network powered by the Ethereum world computer (Alpha)"
arch=("x86_64")
provides=(akasha)
url="https://akasha.world/"
license=("custom")
source=("https://github.com/AkashaProject/dapp/releases/download/${pkgver}/AKASHA_${pkgver}_amd64.deb")
sha256sums=("4799bda602324fa8ab3afa665abde0de60703ac926b1081efcf844a31689edc1")
depends=("gconf"
         "alsa-lib"
         "libxtst"
         "gtk2"
         "nss"
         "libxss")

package() {
    bsdtar xf data.tar.xz
    chmod -R g-w opt
    chmod -R g-w usr
    mv opt "${pkgdir}"
    mv usr "${pkgdir}"
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/AKASHA/akasha ${pkgdir}/usr/bin/akasha
}

