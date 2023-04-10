# Maintainer: Excalibur <saberconer at gmail dot com>

_pkgname=dh-dkms
pkgname=${_pkgname}-bin
_pkgver=3.0.10
_debrel=9
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
sha512sums=('e2d035c3a4e32606ac075240591d9637f377190db2f1cafac340e5307763416eac61209ceafe82f65aa5e96ec37c531238e4e1b70fddf9d8e9ab301957924ba1')

prepare() {
    tar xvf data.tar.xz
}

package() {
    cp -aR usr "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/perl5/vendor_perl/"
    mv "${pkgdir}/usr/share/perl5/Debian" "${pkgdir}/usr/share/perl5/vendor_perl/Debian" 
}
