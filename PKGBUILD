# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexandru Frincu <alexandru.frincu@accenture.com>
pkgname=cm
pkgver=3.15.0
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
sha256sums=('142c052878c4d8544e6098fecbb766bcd83d50df793fec123a878f004cae1b0c')

package() {

# Set up the directory structure
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/chipmunk"
  
  # Copy chipmunk release
  cp -r "${srcdir}/"* "${pkgdir}/usr/lib/chipmunk"

  # Create a symlink
  ln -s /usr/lib/chipmunk/chipmunk "${pkgdir}/usr/bin/chipmunk"
}

