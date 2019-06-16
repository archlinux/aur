pkgname=ofxstatement-git
pkgver=0.6.1.r26.61f9dc1
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=('any')
url="https://github.com/kedder/ofxstatement"
license=('GPL3')
depends=('python-appdirs' 'python-setuptools')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}
