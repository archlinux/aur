# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname='nyan'
pkgver=1.2.2
pkgrel=3
pkgdesc="a simple netcat wrapper"
arch=('any')
url="https://github.com/shibumi/nyan"
license=('GPL3')
depends=('gnu-netcat' 'pv')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shibumi/nyan/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/shibumi/nyan/releases/download/${pkgver}/nyan-${pkgver}.tar.gz.asc")
sha512sums=('02a930ee91ae680a57be6b6fa02091c7ec1fb246c06cb162bc1fe74409aaeecb3f5c4606743835348bfe5564ea96f220433b2d9dee75fcd5e1f826d22cf23327'
            'SKIP')
validpgpkeys=('6DAF7B808F9DF25139620000D21461E3DFE2060D')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 nyan.sh "${pkgdir}/usr/bin/nyan"
  install -D -m644 nyan.1 "${pkgdir}/usr/share/man/man1/nyan.1"
}

# vim:set et sw=2 ts=2 tw=79:
