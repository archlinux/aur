# Maintainer: Morten Linderud <morten@linderud.pw>  

pkgname="python-rofi"
pkgver=1.0.1
pkgrel=4
pkgdesc='A Python module to make simple GUIs with Rofi'
url='https://github.com/bcbnz/python-rofi'
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bcbnz/python-rofi/archive/${pkgver}.tar.gz")
sha256sums=('515fd9f5707df219f480633990d0902efe5b3ef0dd1470bf1ef1844097e44e78')

# Enable for tests
check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py check
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
