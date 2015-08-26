# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=pic32prog
_gitname=$pkgname
_gitbranch=master
_gitauthor=sergev
pkgver=2.0.e79a754
pkgrel=1
pkgdesc="Flash programming utility for Microchip PIC32 microcontrollers"
url="https://github.com/$_gitauthor/$_gitname"
license=('GPL')
source_x86_64=("https://github.com/$_gitauthor/$_gitname/raw/master/linux64/$pkgname")
source_i686=("https://github.com/$_gitauthor/$_gitname/raw/master/linux32/$pkgname")
validpgpkeys=('F0FE029614EA35BC9E4F9768A6ECFD0C40839755') # David Manouchehri
sha512sums_x86_64=('cfaeb44614aca60b7f6c3dde1a0185351ddcba00c4a0e5ba2bb58ab321a5ce7aaf098763bf2b12a37fbfa021f772421d91d50ddfd5394d5820aa44b599e00cdb')
sha512sums_i686=('f817ed45c3ccda6a8d64e22748d516b0c552d4936f80c42622e8d3231ca7d2ba8bfb80365cb8e58c6f1318b57a775ef75d5958dd355a8b3b5180e5c853efcf43')
arch=('i686' 'x86_64')
depends=('libusb' 'libusb-compat')
# makedepends=('git')
optdepends=('ejtagproxy-git: GDB for PIC32'
            'microchip-mplabxc32-bin: C/C++ compiler for PIC32')
conflicts=("$pkgname-git" "$pkgname-svn")
provides=("$pkgname-git" "$pkgname-svn")

pkgver() {
  cd "$srcdir/"
  chmod +x pic32prog
  ./pic32prog -V | awk 'END {print $NF}'
}

package() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/usr/local/bin/"
  cp "$srcdir/pic32prog" "$pkgdir/usr/local/bin/"
}

# vim:set sw=2 sts=2 et:
