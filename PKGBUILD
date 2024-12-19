pkgname=arch-files
pkgver=1.0
pkgrel=1
pkgdesc="Arch Linux Files GUI"
arch=('any')
url="https://archlinux.org"
license=('custom')
makedepends=('pyinstaller' 'python' 'tk')
source=("main.py")
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
  cd "${srcdir}"

  # Use PyInstaller to build the main.py
  pyinstaller --onefile main.py
}

package() {
  cd "${srcdir}"

  # Install the built binary to the package directory
  install -Dm755 "dist/main" "${pkgdir}/usr/bin/arch-files"
}
