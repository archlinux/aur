# Maintainer: Alexandru Frincu <alexandru.frincu@accenture.com>
pkgname=cmonk
pkgver=3.10.5
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
source=("$url/releases/download/$pkgver/chipmunk@$pkgver-linux-portable.tgz")

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
sha256sums=('bbb9db026e0885abcf0ac1b506fa9a68bf26dc32298e27f9bfbb9ef48e04ebe8')
