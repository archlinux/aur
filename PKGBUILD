# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgver=5.2020.2
_pkgmajver=$(echo $pkgver | cut -f1 -d.)
pkgrel=5
_prodvar=micro
_prodname=payara
pkgname=${_prodname}${_pkgmajver}-${_prodvar}
pkgdesc="A Java EE application server, derived from GlassFish Open Source Edition. (Micro Edition)"
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname" "payara51")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("payara-${pkgver}-micro.zip::https://search.maven.org/remotecontent?filepath=fish/${_prodname}/extras/${_prodname}-${_prodvar}/$pkgver/${_prodname}-${_prodvar}-${pkgver}.jar"
        "payara5-micro.service")

sha256sums=('d551dff47d5e4b17525916b5fd6794c349aa98baad90e25dd19640993d7e0538'
            '9276630a47942e37756e23355ef60ce003bba93c712c4f04be62667494da17ff')
sha512sums=('201d37f73618f0849e27791b967b29044864d3d26548bc216c7937c572fe71a1ff9b50c680267089eb537b16574b15d32462707a9d9d4ffdc7b156bbcbc46e3c'
            '0a29479dd5dd11ba69383554d64fad35d438678e63274e107da2ab959c78be8809e4f8ca837f88a880dc69f09de330c253f00c4acbd6e70e5dac7b72826fe0bf')


package() {
    mkdir -p $pkgdir/opt/$pkgname
    cp -a META-INF MICRO-INF fish $pkgdir/opt/$pkgname
    install -D $srcdir/payara5-micro.service $pkgdir/usr/lib/systemd/system/payara5-micro.service
}
# vim:set ts=2 sw=2 et:
