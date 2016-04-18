# Maintainer: Duy Truong <jimreynold2nd@yahoo.com>

pkgname=animecheck-git
pkgver=r98.e87a977
pkgrel=1
pkgdesc="Commandline CRC32, MD5 and eD2k-based hashing script also capable of reading and creating SFV and MD5 checksum files and generating eD2k links."
arch=('any')
url="https://github.com/OmegaPhil/animecheck"
license=('GPL')
makedepends=('git')
depends=('python')
source=('git+https://github.com/OmegaPhil/animecheck.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/animecheck"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/animecheck"
   mkdir -p $pkgdir/usr/bin
   install -m 0755 animecheck.py $pkgdir/usr/bin/
}
