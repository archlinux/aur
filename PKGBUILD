# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>

pkgname='exabgp'
pkgver=4.1.3
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

md5sums=('14ba7f3c21412c9036e243993e55c913')
sha1sums=('1c5c2e32c7c9f721f4661cbd61aa62a1b97f4332')
sha256sums=('f14c7b1996464a4313d364cbd36e6941430e1c6121273c4fdd009e6beed2e938')
