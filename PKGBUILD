# Maintainer: kpcyrd <git@rxv.cc>

pkgname="python-fints"
pkgver="0.2.1"
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz)
sha512sums=('4c1d651e51450e916fcbf9e91aacbd14fe6331770ae0395b66aeafd38a7fa2ccab66fbdd140568b76831fda9d25669644bfaf22c1ac47c0d1b8b4a630641487b')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install -O1 --root="${pkgdir}"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
