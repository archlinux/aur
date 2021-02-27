# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=notestorm
pkgname=notestorm-git
pkgver=r14.6beca18
pkgrel=1
pkgdesc="Extremely powerful and easy note taking app for the CLI written in bash"
arch=('any')
url="https://git.2mb.codes/~stormdragon2976/$_pkgname"
license=('GPL')
depends=('bash' 'dialog' 'w3m')
makedepends=('git')
optdepends=('gnupg: Encrypted notes support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}")
md5sums=("SKIP")

pkgver()
{
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
package()
 {
  cd "$_pkgname"
  install -D -m755 "notestorm" "$pkgdir/usr/bin/notestorm"
  }

# vim:set ts=2 sw=2 et:
