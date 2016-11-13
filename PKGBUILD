#Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=inetsim
pkgver=1.2.6
pkgrel=2
pkgdesc="Internet Services Simulation Suite"
url="http://www.inetsim.org"
depends=('perl-net-server' 'perl-net-dns' 'perl-ipc-shareable' 'perl-digest-sha1' 'perl-io-socket-ssl')
arch=('any')
license=('GPL')
optdepends=('perlipq: Support for IP-based connection redirection')
source=("${pkgname}-${pkgver}.tar.gz::http://www.inetsim.org/downloads/${pkgname}-${pkgver}.tar.gz"
		"inetsim.service")

sha512sums=('d8460deda14fc8d110307ec025348855982abf2bfc0c19efe2b07a93fdfb54d7245a9750087344fa9b4816f412eb7c8ac93d040dbeb5642a93bf07207e3365f1'
            'f08b4f7ae13cb7c1dc380101dcc117502cc5979be0b1a23ec26aecf708ddaecd3dd4257fae505e3a338dd921f83c24b5b9f1d75d2d6bf2ea38397e255fc883bb')
install="inetsim.install"

package() {
  mkdir -p "${pkgdir}/opt/"
  
  sed -i "s/\.\/lib/\/opt\/inetsim\/lib/" "${srcdir}/${pkgname}-${pkgver}/inetsim"
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
