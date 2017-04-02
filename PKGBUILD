# Maintainer: Alexandre Jesus <adbjesus@gmail.com>

_pkgname=lcurse
pkgname=${_pkgname}-git
pkgver=20170402_r91.e0de42c
pkgrel=1
pkgdesc="Python script to have a curse compatible client for linux"
arch=('any')
url="https://github.com/ephraim/lcurse"
license=('Unlicense')
depends=('python' 'python-beautifulsoup4' 'python-pyqt5' 'python-lxml')
makedepends=('git')
provides=("${_pkgname}")
source=('git+https://github.com/ephraim/lcurse.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "%s_r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  python setup.py install --root="$pkgdir/" --optimize=1
}

