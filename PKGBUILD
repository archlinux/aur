# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: McLenin <mclenin at gooogles email>
pkgname=libstdc++296
pkgver=2.96.126
pkgrel=3
pkgdesc="Standard C++ libraries for Red Hat 7.3 backwards compatibility compiler. With additions from OpenSUSE 13.1. Provides libstdc++-libc6.2-2.so.3"
arch=("i686" "x86_64")
url="http://rpmfind.net"
license=('GPL')
groups=()
depends=()
makedepends=('rpmextract')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i686+=("libstdc++296_32.rpm::ftp://rpmfind.net/linux/opensuse/distribution/13.1/repo/oss/suse/i586/compat-2010.1.31-17.1.2.i586.rpm")
source_x86_64+=("libstdc++296_64.rpm::ftp://rpmfind.net/linux/opensuse/distribution/13.1/repo/oss/suse/x86_64/compat-32bit-2010.1.31-17.1.2.x86_64.rpm")
noextract=()
md5sums_i686+=('6048df58c6459b5d4cf43528dfe9d0a3')
md5sums_x86_64+=('4048275024eb4663f920833dfd2de4b1')


package() {
  cd "$pkgdir"
  if test "$CARCH" == x86_64; then
    rpmextract.sh "$srcdir"/"$pkgname"_64.rpm
  else
    rpmextract.sh "$srcdir"/"$pkgname"_32.rpm
  fi
}

