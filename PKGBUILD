# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: McLenin <mclenin at gooogles email>

_pkgname=libstdc++296
pkgname=libstdc++296-bin
pkgver=2.96.126
pkgrel=1
pkgdesc="Standard C++ libraries for Red Hat 7.3 backwards compatibility compiler. With additions from OpenSUSE 13.1. Provides libstdc++-libc6.2-2.so.3"
arch=('i686' 'x86_64')
url="https://opensuse.pkgs.org/42.3/opensuse-oss/compat-32bit-2010.1.31-4.3.x86_64.rpm.html"
license=('GPL')
makedepends=('rpmextract')
conflicts=("$_pkgname")
provides=("$_pkgname")
source_i686=("libstdc++296-i686.rpm::http://ftp.jaist.ac.jp/pub/pkgsrc/distfiles/suse131/compat-2010.1.31-17.1.2.i586.rpm")
source_x86_64=("libstdc++296-x86_64.rpm::https://download.opensuse.org/distribution/leap/42.3/repo/oss/suse/x86_64/compat-32bit-2010.1.31-4.3.x86_64.rpm")
noextract=()
md5sums_i686=('6048df58c6459b5d4cf43528dfe9d0a3')
md5sums_x86_64=('a1680572901cc6c4a5346bf26297afdf')

package() {
  cd "$pkgdir"
  if [[ $CARCH == x86_64 ]]; then
    rpmextract.sh "$srcdir"/"$_pkgname-x86_64.rpm"
  else
    rpmextract.sh "$srcdir"/"$_pkgname-i686.rpm"
  fi
}
