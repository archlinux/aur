# PKGBUILD for AUR

# Maintainer: Seann Moser <your_email@example.com>
# This package will build hypr-u from source.

pkgname=hypr-u
pkgver=1.0.0 # Set this to the version of your app, or use git commit hash
pkgrel=1
pkgdesc="A tool for hyprland"
arch=('x86_64')
url="https://github.com/Seann-Moser/hypr-u"
license=('MIT') # Or whatever license applies to your project
depends=('go' 'git') # Add other dependencies if necessary
makedepends=('go') # Go should be listed as a makedependency
source=("git+https://github.com/Seann-Moser/hypr-u.git#branch=main")
sha256sums=('SKIP') # You can skip checksum as it will be built from the git source

# Build process
build() {
  cd "$srcdir/$pkgname"
  
  # Initialize Go environment
  go mod tidy  # Ensure Go modules are up to date
  
  # Build the binary (replace this if the build command differs)
  go build -o hypr-u .
}

# Package the binary
package() {
  cd "$srcdir/$pkgname"
  
  # Install the binary into the appropriate location
  install -Dm755 hypr-u "$pkgdir/usr/bin/hypr-u"
}

# Optional: If your package needs post-installation or post-removal steps
# You can define these functions if necessary:
#   post_install() {
#     echo "Package installed!"
#   }
#
#   post_remove() {
#     echo "Package removed!"
#   }
