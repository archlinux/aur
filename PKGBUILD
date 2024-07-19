# Maintainer: Your Name <your.email@example.com>
pkgname=kernel-builder
pkgver=1.0
pkgrel=2
pkgdesc="Simplifies Linux kernel compilation with version selection, patching, and configuration options for Arch Linux and Ubuntu/Debian, enhancing installation efficiency and customization."
arch=('any')
url="https://github.com/Someshwar1006/Kernel-Builder"
license=('MIT')
depends=('python' 'python-requests' 'python-pip')  # Added python-pip as a dependency
source=("https://github.com/Someshwar1006/Kernel-Builder/raw/main/kernel-builder-2.0.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/"

  # Ensure python-pip is installedy7

  # Use pip to install requests to the package directory
  pip install --target="$pkgdir/usr/lib/$pkgname" requests

  # Install the main script and make it executable
  install -Dm755 main_AUR.py "$pkgdir/usr/bin/kernel-builder"
  install -Dm644 arch.py "$pkgdir/usr/lib/$pkgname/arch.py"
  install -Dm644 ubuntu.py "$pkgdir/usr/lib/$pkgname/ubuntu.py"

  # Install management scripts
  install -Dm644 arch_man.py "${pkgdir}/usr/lib/${pkgname}/arch_man.py"
  install -Dm644 ubuntu_man.py "${pkgdir}/usr/lib/${pkgname}/ubuntu_man.py"

  # Install license and readme
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
