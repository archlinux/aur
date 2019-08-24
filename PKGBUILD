# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>

pkgname='exabgp'
pkgver=4.1.2
pkgrel=1
pkgdesc="The BGP swiss army knife of networking"
url="https://github.com/Exa-Networks/exabgp"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
arch=('any')
source=("exabgp-${pkgver}.tar.gz::https://github.com/Exa-Networks/exabgp/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/exabgp-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 etc/systemd/exabgp.service "${pkgdir}/usr/lib/systemd/system/exabgp.service"
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('cf36ca988159da337048a80148e66877')
sha1sums=('73712e4f20a5956890052467ccf3b01022977f87')
sha256sums=('5921e002f196e814d02349a15c250b1fc8bf45c7299b6b652d2fed04eebb529a')
