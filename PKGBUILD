# Maintainer: Morten Linderud <morten@linderud.pw>  

pkgname="python-rofi"
pkgver=1.0.1
pkgrel=1
pkgdesc='A Python module to make simple GUIs with Rofi'
url='https://github.com/bcbnz/python-rofi'
arch=('any')
license=('MIT')
makedepends=('python')
source=("https://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f2d6b8c7a1fcd1807b19cf27329d9a7f6c839cc9e8877396a819337cfa797a61')

# Enable for tests
check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
