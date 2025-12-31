pkgname=archmode-git
pkgver=r36.c354d59
pkgrel=1
pkgdesc="A powerful system mode manager for Arch Linux"
arch=('x86_64')
url="https://github.com/theofficalnoodles/ArchMode"
license=('MIT')
depends=('bash' 'sudo')
makedepends=('git')
source=("git+https://github.com/theofficalnoodles/ArchMode.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ArchMode"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/ArchMode"
  install -Dm755 archmode.sh "$pkgdir/usr/bin/archmode"
  install -Dm644 archmode.service "$pkgdir/usr/lib/systemd/system/archmode.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/archmode/README.md"
}

