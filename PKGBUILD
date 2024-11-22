# Maintainer: Mohamed1242012 <mohamed@devlix.org>
# Package: devlix-git
# Description: A lightweight, customizable window manager based on dwm.
# URL: https://github.com/Mohamed1242012/devlix
# License: MIT
# Depends on: git
# Conflict with: devlix
# Provides: devlix
# Arch: any
# Version: 1.0.0
# Source: https://github.com/Mohamed1242012/devlix.git
# SHA256: SKIP

pkgname=devlix
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight, customizable window manager based on dwm."
arch=('any')
url="https://github.com/Mohamed1242012/devlix"
license=('MIT')
depends=('git')
conflicts=('devlix')  # Conflicts with the standard devlix package
provides=('devlix')
source=("git+https://github.com/Mohamed1242012/devlix.git")

# Prepare the package by cloning the repository
prepare() {
  cd "$srcdir"
  # Clone the GitHub repository
  git clone https://github.com/Mohamed1242012/devlix.git "$HOME/devlix"
}

# Build the package
build() {
  cd "$HOME/devlix"
  # Make the installation script executable
  chmod +x install.sh
}

# Install the package
package() {
  cd "$HOME/devlix"
  # Run the install.sh script in TUI mode
  ./install.sh --mode=tui -y
}
