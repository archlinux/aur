pkgname=nfu-git
pkgver=20141115
pkgrel=1
pkgdesc="Numeric Fu for the command line"
arch=('any')
url="https://github.com/spencertipping/nfu"
license=('MIT')
depends=('perl' 'perl-json')
makedepends=('git')

_gitroot="git://github.com/spencertipping/nfu.git"
_gitname="nfu"

build() {
  cd "$srcdir"

  msg "Cloning repository..."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$_gitname/nfu" "$pkgdir/usr/bin"
}
