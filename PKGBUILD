# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=termfeed-git
pkgver=r35.03f897d
pkgrel=0
pkgdesc="A simple terminal rss feed reader"
arch=('any')
url="https://github.com/iamaziz/TermFeed"
license=('MIT')
makedepends=('git')
depends=('python' 'python-feedparser')
source=('git+https://github.com/iamaziz/TermFeed.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/TermFeed"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/TermFeed"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
