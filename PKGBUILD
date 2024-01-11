# Maintainer: Alexandru Frincu <alexandru.frincu@accenture.com>
pkgname=cm
pkgver=3.10.3
pkgrel=1
pkgdesc="fast logfile viewer for Analyzing Large Logfiles
 Chipmunk is a fast logfile viewer designed for analyzing 
 large logfiles. It features super-fast search capabilities 
 and is an invaluable tool for developers who need to analyze 
 log data."
arch=('x86_64')
url="https://github.com/esrlabs/chipmunk"
license=('Apache-2.0')
depends=('gtk3', 'alsa-lib', 'libdrm', 'cups')
source=("https://github.com/esrlabs/chipmunk/releases/download/$pkgver/chipmunk@$pkgver-linux-portable.tgz")

build() {
  cd "$srcdir"
  # Extract the source code
  tar xf "chipmunk@$pkgver-linux-portable.tgz"
}

package() {
# Remove existing directory structure
  rm -rf "${pkgdir}/usr/lib/chipmunk"

# Set up the directory structure
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/chipmunk"
  
  # Copy chipmunk release
  cp -r "${srcdir}/"* "${pkgdir}/usr/lib/chipmunk"

  # Create a symlink
  ln -s /usr/lib/chipmunk/chipmunk "${pkgdir}/usr/bin/chipmunk"
}

sha256sums=('44aa87935c69d2cd16339385fb846fe518e9c8f3ddb70dd61eba10268dff58eb')