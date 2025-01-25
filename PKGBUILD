# Maintainer: Nicolas Lorin <androw95220@gmail.com>
# Contributor: Stanislav Seletskiy <s.seletskiy@gmail.com>

# Upstream URL: https://github.com/seletskiy/runki
#
# Dont forget to star the repo if you liked the package

pkgname=runki-git
pkgver=20240325
pkgrel=0
pkgdesc="Ankiweb.net console client. Manage Anki flashcards without a friction."
arch=('any')
url="https://github.com/seletskiy/runki"
license=('MIT')
depends=()
makedepends=('git' 'go')
conflicts=('runki')
provides=('runki')
source=("$pkgname"::'git+https://github.com/seletskiy/runki.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$pkgname"
  go build
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  mv runki-git $pkgdir/usr/bin/runki
}
