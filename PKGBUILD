# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=nsec3walker
pkgver=2010.12.23
pkgrel=1
pkgdesc="walk NSEC3 secured DNSSEC zones"
url="https://dnscurve.org/nsec3walker.html"
arch=('i686' 'x86_64')
license=('unknown')
depends=("python")
source=("https://dnscurve.org/nsec3walker-20101223.tar.gz")
md5sums=('4ab591a5bb0c89bcd87a93c1e03bcd39')

build(){
    cd "${srcdir}/nsec3walker-20101223"
    make
}
 
package() {
    cd "${srcdir}/nsec3walker-20101223"
    for i in collect  dicthashes  query  randomhashes  unhash
    do
        install -Dm755 $i "${pkgdir}/usr/bin/nsec3walker-$i"
    done
}
