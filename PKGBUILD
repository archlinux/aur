# Maintainer: florianmw <flo@i-z-i.net>

pkgname=('automathemely')
_name='AutomaThemely'
pkgver='1.3'
pkgrel=1
pkgdesc="Simple, set-and-forget python application for changing between GNOME themes according to light and dark hours."
url="https://github.com/C2N14/AutomaThemely"
depends=('python')
makedepends=('python-setuptools')
license=('GPL-3.0')
arch=('any')
source=("https://github.com/C2N14/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('14e5100eb911ab8e5667a3358e1e7ed6540fd1a294ba4d451d4db480b08c3555')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  depends+=('python-astral' 'python-tzlocal' 'python-schedule')
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
