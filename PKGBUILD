# Please report PKGBUILD bugs at
# https://github.com/ystein/archlinux-aur-packages

# Maintainer: Yannik Stein <yannik.stein [at] gmail.com>
# Maintainer: Roberto Calabrese <robertocalabrese75 [at] gmail.com>

pkgname='libgcj'
pkgver=14_4.8.2_16
pkgrel=1
pkgdesc="Dynamically load and interpret java class files. Built from binary \
executables available in Debian repositories. Please report PKGBUILD bugs at \
https://github.com/ystein/archlinux-aur-packages."
url=http://gcc.gnu.org/java/
arch=(i686 x86_64)
license=(GPL)
conflicts=(gcc-gcj)

if [ $CARCH = 'i686' ]; then
  _DEBARCH=i386
  md5sums=(7b5f8c69e8370cdb77e0c808f7645a5d)
else
  _DEBARCH=amd64
  md5sums=(f378e0371f26140efb87f016c817a04a)
fi
source=(http://ftp.de.debian.org/debian/pool/main/g/gcc-4.8/$pkgname${pkgver%_*}-${pkgver##*_}_${_DEBARCH}.deb)

build() {
  tar xf data.tar.*
}

package() {
  find -type f -name 'libgcj.so*' \
    -execdir install -Dm755 {} "$pkgdir/usr/lib/{}" \;
}
