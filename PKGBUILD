# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=checksec-git
pkgver=1.7.5.r33.g3de323e
pkgrel=1
pkgdesc="A bash script to check the security properties of executables"
arch=('i686' 'x86_64')
url="https://github.com/slimm609/checksec.sh"
license=('BSD')
depends=('bash' 'binutils' 'procps-ng')
makedepends=('git')
provides=('checksec')
conflicts=('checksec')
source=("git+https://github.com/slimm609/checksec.sh.git")
sha256sums=('SKIP')


pkgver() {
  cd "checksec.sh"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "checksec.sh"

  install -Dm755 "checksec" "$pkgdir/usr/bin/checksec"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/checksec/LICENSE.txt"
  install -Dm644 "ChangeLog" "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "extras/man/checksec.7" -t "$pkgdir/usr/share/man/man7"
  install -Dm644 "extras/zsh/_checksec" -t "$pkgdir/usr/share/zsh/site-functions"
}
