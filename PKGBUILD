# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
_pkgname=super_unko
pkgname=$_pkgname-git
pkgver=r420.a73b56d
pkgrel=1
pkgdesc="Super Unko project is the one of the awesome, clean and sophisticated OSS project in the world."
arch=('i686' 'x86_64')
url="https://github.com/unkontributors/super_unko"
license=('custom:unko')
makedepends=(git)
optdepends=('toilet: for unko.toilet'
            'xterm: for unko.puzzle'
            'xdotool: for unko.puzzle'
            'bc: for unko.puzzle'
            'cowsay: for unko.think'
            'echo-sd: for unko.shout')
conflicts=(super_unko)
provides=(super_unko)
source=("$_pkgname::git+https://github.com/unkontributors/super_unko.git#branch=oshiri")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  ./install.sh $pkgdir/usr
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
