# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=git-test-git
_gitname=git-test
pkgver=r7.e71d22f
pkgrel=1
pkgdesc="Git extension to conveniently test all distinct versions."
arch=('any')
license=('Apache')
url="https://github.com/spotify/git-test"
depends=('git')
source=("$_gitname::git+https://github.com/spotify/git-test.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 0755 git-test "$pkgdir/usr/bin/git-test"
  install -Dm 0644 git-test.1 "$pkgdir/usr/share/man/man1/git-test.1"
}
