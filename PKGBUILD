# Maintainer: Excalibur <saberconer at gmail dot com>

_pkgname=dh-dkms
pkgname=${_pkgname}-bin
_pkgver=3.0.12
_debrel=5
pkgver=${_pkgver}_${_debrel}
pkgrel=1
pkgdesc='debhelper addon for the Dynamic Kernel Module System (DKMS)'
url='https://salsa.debian.org/debian/dkms'
arch=('any')
license=('GPL3')
depends=('perl' 'debhelper')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("http://ftp.debian.org/debian/pool/main/d/dkms/${_pkgname}_${_pkgver}-${_debrel}_all.deb")
sha512sums=('a26800878e18d330a94758a65cd1db739452de04745dbe2a79d79028f7b3d9b829f9622c268084997624bd06a305232a33ab8811c8d1d4c18cb72e9fd90b7dd4')

prepare() {
    tar xvf data.tar.xz
}

package() {
    cp -aR usr "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/perl5/vendor_perl/"
    mv "${pkgdir}/usr/share/perl5/Debian" "${pkgdir}/usr/share/perl5/vendor_perl/Debian" 
}
