# Maintainer: Mildred Ki'Lya <mildred-nospam.at.mildred.fr>
pkgname=rnc2rng
pkgver=2.0
pkgrel=1
pkgdesc="Convert compact form Relac-NG schemas (rnc) to XML (rng)"
url="https://github.com/djc/rnc2rng"
arch=('any')
license=('custom:public domain')
depends=('python' 'python-rply')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/djc/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('74d0b9b1977bdf879a78e418f3f8061b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 setup.py "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim:set ts=2 sw=2 et:

