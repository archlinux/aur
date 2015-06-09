# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-html2md
pkgver=0.1.3
pkgrel=2
pkgdesc="Downloads HTML from a URL, optionally passes it through Instapaper’s mobilizer, and converts it to Markdown"
arch=('any')
depends=('python2' 'python2-argcomplete' 'python2-argh' 'python2-html2text' 'python2-logbook' 'python2-pyquery' 'python2-requests' 'python2-verlib')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/html2md"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('5ce25928cf36859302bbf08734fdf21c')
sha256sums=('7053cb8cb55b065f83127164405d4002f44fc57ac8e64b4c1e2ba210349ad5e0')
provides=('html2md' 'python2-html2md')
conflicts=('html2md')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
