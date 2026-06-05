# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexandru Frincu <alexandru.frincu@accenture.com>

pkgname=cm
pkgver=3.19.6
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
sha256sums=('f8776e6c444a25d2b906b758d6f0fe203acc9d8db06d49d22e820f5e6e388afb')

package() {

# Set up the directory structure
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/chipmunk"
  
  # Copy chipmunk release
  cp -r "${srcdir}/"* "${pkgdir}/usr/lib/chipmunk"

  # Create a symlink
  ln -s /usr/lib/chipmunk/chipmunk "${pkgdir}/usr/bin/chipmunk"
}

