# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Philippe Hürlimann <p@hurlimann.org>

pkgname=python-ftfy
pkgver=5.5.1
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-wcwidth')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/LuminosoInsight/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('1a99d65e1895412ca17e147083e17b800d235dda6713b123d720887f27ffc4133892a671f0ad7eb6158cce8587cfb147592d19f3c71e06a4ed34a8f590f7772a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
