# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexandru Frincu <alexandru.frincu@accenture.com>
pkgname=cm
pkgver=3.14.3
pkgrel=1
pkgdesc="fast logfile viewer for Analyzing Large Logfiles
 Chipmunk is a fast logfile viewer designed for analyzing 
 large logfiles. It features super-fast search capabilities 
 and is an invaluable tool for developers who need to analyze 
 log data."
arch=('x86_64')
url="https://github.com/esrlabs/chipmunk"
license=('Apache-2.0')
depends=('gtk3' 'alsa-lib' 'libdrm' 'cups')
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

sha256sums=('16323745a121fb3ae0e2e15911ae421f624587755febab67d85f207ea4733d73')
