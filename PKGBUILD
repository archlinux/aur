# Maintainer: Dmitriy Q <atsip-help-at-yandex-dot-ru>

pkgname=python-pyqrcode-git
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=1.2.1.r265.674a77b
pkgrel=6
pkgdesc="Python 3 module to generate QR Codes"
arch=('any')
url="https://github.com/mnooner256/pyqrcode"
depends=('bash' 'python')
makedepends=('git' 'python-build' 'python-pip' 'python-coverage' 'python-wheel' 'python-pypandoc')
license=("BSD3")
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

#pkgver() {
#  cd "$_srcname"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

package() {
    cd "$srcdir/$_srcname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
