# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
_pkgname=super_unko
pkgname=$_pkgname-git
pkgver=r119.9783a18
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
            'cowsay: for unko.think')
provides=(super_unko)
source=("$_pkgname::git+https://github.com/unkontributors/super_unko.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -d $pkgdir/usr/bin
  cp bin/* $pkgdir/usr/bin
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
