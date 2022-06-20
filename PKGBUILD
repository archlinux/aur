# Maintainer: Storm Dragon <stormdragon2976@gmail.com>

pkgname="bashblog-git"
_pkgname="${pkgname%-*}"
pkgver=3
pkgrel=1
pkgdesc="A single Bash script to create blogs."
arch=('any')
url="https://github.com/cfenollosa/bashblog"
license=('GPL3')
depends=('bash')
makedepends=('git')
optdepends=('discount: markdown support')
provides=("bb")
conflicts=("bb")
source=("git+${url}.git")
install="bashblog-git.install"
md5sums=("SKIP")

pkgver()
{
  cd "$_pkgname"
  git shortlog | head -n 1 | tr -Cd "[:digit:]"
}
 
package()
 {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
 install -d "$pkgdir/usr/share/$_pkgname"
  install -m755 "$_pkgname/bb.sh" "$pkgdir/usr/bin/bb"
  install -m666 "$_pkgname/README.md" "$pkgdir/usr/share/$_pkgname"
  }

# vim:set ts=2 sw=2 et:
