# Maintainer: Barry Smith <brrtsm@gmail.com>
pkgname=python2-vulndb
pkgver=0.0.19
pkgrel=2
pkgdesc="Vulnerability Database"
url='https://github.com/vulndb/python-sdk/'
arch=('any')
license=('custom:BSD-3-Clause')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgver}.tar.gz::https://pypi.python.org/packages/d3/5e/512a8c7abe1ea11939524eb07758f3813d8d49bf00bb6023d18df1837c4d/vulndb-${pkgver}.tar.gz)
sha512sums=('b2176762b91d5aab595db2afdddee56ebf3dc27104cce4a3208e46eff72911ddd4e0c197e99ab27be0ecc10d093c08fc0fb071fb75a379b8cd35410c0ad08533')

package() {
  cd "vulndb-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
