# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=gpowned-git
_pkgname="${pkgname%-git}"
_upstream=GPOwned
pkgver=r11.59fe547
pkgrel=2
pkgdesc="Buggy script to play with GPOs"
arch=('any')
url="https://github.com/X-C3LL/gpowned/"
license=(custom)
makedepends=('git')
depends=('python')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm0755 $srcdir/$_pkgname/$_upstream.py "$pkgdir/usr/bin/$_pkgname.py"
}

