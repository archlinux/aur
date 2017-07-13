# Maintainer: Robin McCorkell <robin@mccorkell.me.uk>
pkgname=haxor-news
pkgver=0.4.2
pkgrel=1
pkgdesc="A Hacker News command line interface"
arch=(any)
url="https://github.com/donnemartin/haxor-news"
license=('Apache')
depends=(
  'python'
  'python-click'
  'python-colorama'
  'python-requests'
  'python-pygments'
  'python-prompt_toolkit'
  'python-six'
)
source=(
  "$url/archive/$pkgver.tar.gz"
)

md5sums=('03307fccd2d4eb13b8af57203ec28696')

prepare() {
  cd "$srcdir"/"$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
