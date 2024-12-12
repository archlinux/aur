# Maintainer: Lakshmanan <lakshmanoni1234@gmail.com>
pkgname=pacsaviour
pkgver=0.1.0
pkgrel=2
pkgdesc="An automation tool for optimising mirrors, cleaning and updating the system"
arch=('x86_64')
url="https://github.com/Luxxgit2k4/pacsaviour"
license=('MIT')
depends=('bash' 'git' 'reflector')
makedepends=(git)
source=("git+https://github.com/Luxxgit2k4/pacsaviour.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  # Ensure all scripts are executable
  chmod +x main.sh scripts/mirror_optimize.sh scripts/cleanup.sh scripts/update.sh scripts/ascii.sh
  # Install the main script as pacsaviour command
  install -Dm755 "$srcdir/$pkgname/main.sh" "$pkgdir/usr/bin/pacsaviour"

  # Install the other scripts from the 'scripts' subdirectory
  install -Dm755 "$srcdir/$pkgname/scripts/mirror_optimize.sh" "$pkgdir/usr/lib/pacsaviour/mirror_optimize.sh"
  install -Dm755 "$srcdir/$pkgname/scripts/cleanup.sh" "$pkgdir/usr/lib/pacsaviour/cleanup.sh"
  install -Dm755 "$srcdir/$pkgname/scripts/update.sh" "$pkgdir/usr/lib/pacsaviour/update.sh"
install -Dm755 "$srcdir/$pkgname/scripts/ascii.sh" "$pkgdir/usr/lib/pacsaviour/ascii.sh"
}
