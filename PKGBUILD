#Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=inetsim
pkgver=1.2.6
pkgrel=4
pkgdesc="Internet Services Simulation Suite"
url="http://www.inetsim.org"
depends=('perl-net-server' 'perl-net-dns' 'perl-ipc-shareable' 'perl-digest-sha1' 'perl-io-socket-ssl')
arch=('any')
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::http://www.inetsim.org/downloads/${pkgname}-${pkgver}.tar.gz"
        "inetsim.service"
        "${pkgname}-${pkgver}.tar.gz.asc::http://www.inetsim.org/downloads/${pkgname}-${pkgver}.tar.gz.sig")

sha512sums=('d8460deda14fc8d110307ec025348855982abf2bfc0c19efe2b07a93fdfb54d7245a9750087344fa9b4816f412eb7c8ac93d040dbeb5642a93bf07207e3365f1'
            'b0b5561ec915985545b6a9343cff530b022694d7bf7a06d4a2e55edb4f089e9f339ac491c6db741ca076683758d7bf294a1587236c45f80e76ae7a727663cad4'
            'SKIP')
validpgpkeys=('5ADF5239D9AAAD3C455094916881B9A7E9F601C8')
install="inetsim.install"

prepare() {
  sed -i "s/\.\/lib/\/opt\/inetsim\/lib/" "${srcdir}/${pkgname}-${pkgver}/inetsim"
}

package() {
  mkdir -p "${pkgdir}/opt/"

  install -D -m644 "${srcdir}/inetsim.service" \
    "${pkgdir}/usr/lib/systemd/system/inetsim.service"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/man/man1/inetsim.1" \
    "${pkgdir}/usr/share/man/man1/inetsim.1"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/man/de/man1/inetsim.1" \
    "${pkgdir}/usr/share/man/de/man1/inetsim.1"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/man/de/man5/inetsim.conf.5" \
    "${pkgdir}/usr/share/man/man5/inetsim.conf.5"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/man/de/man5/inetsim.conf.5" \
    "${pkgdir}/usr/share/man/man5/inetsim.conf.5"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/inetsim"

}

# vim:set et sw=2 ts=2 tw=79:
