# Maintainer: Ahmed Jerjawi
pkgname=pngdefry
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to remove -iphone optimization and reorder RGB(A) pixels for PNG images"
arch=('x86_64')
url="https://github.com/Tatsh/pngdefry"
license=('public-domain')
depends=('glibc')

# Original repository doesn't exist; this is an archived fork
source=("https://github.com/Tatsh/pngdefry/archive/refs/heads/master.tar.gz")
sha256sums=('d6b69f14b7fcb9605b09a6a408c46df74de04b04fc4075febb1499ad6bf1c276')

makedepends=('base-devel')


# Build section
build() {
  cd "$srcdir/pngdefry-master/source"
  make
}

# Package section
package() {
  # Install the binary to /usr/bin
  install -Dm755 "$srcdir/pngdefry-master/source/pngdefry" "$pkgdir/usr/bin/pngdefry"

  # Install the man page to /usr/share/man/man1
  install -Dm644 "$srcdir/pngdefry-master/man/pngdefry.1" "$pkgdir/usr/share/man/man1/pngdefry.1"
}
