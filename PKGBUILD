# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Philippe Hürlimann <p@hurlimann.org>

pkgname=python-ftfy
pkgver=5.6
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-wcwidth')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/LuminosoInsight/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('4b226b277ac2011f733275045d6f6af79b0f046dec3740f6dd568a410af1cf89f03acced462b3b4e0d49c9eadc2fc307565644d068ae1c1c9ab1a351a606daef')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
