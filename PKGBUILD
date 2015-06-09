# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-preview-markup
pkgver=0.3
pkgrel=1
pkgdesc="Live preview Markdown and reStructuredText files as HTML in a web browser"
arch=('any')
depends=('python2'
         'python2-beautifulsoup4'
         'python2-coloredlogs'
         'python2-docutils'
         'python2-flask'
         'python2-humanfriendly'
         'python2-misaka'
         'python2-pygments')
makedepends=('python2-setuptools')
url="https://github.com/xolox/python-preview-markup"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('a250a7d2bbf299d51d62d799e63e57e5')
sha256sums=('f5ce90f6407e8b6d0deeea5c8130df6508b3f69ef2157454c0ebf09b624a3c39')
provides=('preview-markup' 'python2-preview-markup')
conflicts=('preview-markup')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
