# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=checksec-git
pkgver=2.6.0.r42.g5ec2eb7
pkgrel=2
pkgdesc="A bash script to check the security properties of executables"
arch=('any')
url="https://github.com/slimm609/checksec.sh"
license=('BSD')
depends=('bash' 'binutils' 'procps-ng')
makedepends=('git')
provides=("checksec=$pkgver")
conflicts=('checksec')
source=("git+https://github.com/slimm609/checksec.sh.git")
sha256sums=('SKIP')


pkgver() {
  cd "checksec.sh"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "checksec.sh"

  install -Dm755 "checksec" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/checksec"
  install -Dm644 "ChangeLog" "README.md" -t "$pkgdir/usr/share/doc/checksec"
  install -Dm644 "extras/man/checksec.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "extras/zsh/_checksec" -t "$pkgdir/usr/share/zsh/site-functions"
}
