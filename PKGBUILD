# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Yannik Stein <yannik.stein [at] gmail.com>
# Contributor: Roberto Calabrese <robertocalabrese75 [at] gmail.com>

pkgname='libgcj'
pkgver=15_4.9.0_6
pkgrel=1
pkgdesc="Dynamically load and interpret java class files. Built from binary \
executables available in Debian repositories."
url=http://gcc.gnu.org/java/
arch=(i686 x86_64)
license=(GPL)
conflicts=(gcc-gcj)

if [[ $CARCH == i686 ]]; then
  _DEBARCH=i386
  sha1sums=('319701c602c135e9b8627200d330f28f30068097')
else
  _DEBARCH=amd64
  sha1sums=('480182c3e5875a996757665b91893733fa044de4')
fi
source=(http://ftp.debian.org/debian/pool/main/g/gcc-4.9/$pkgname${pkgver%_*}-${pkgver##*_}_${_DEBARCH}.deb)

prepare() {
  tar xf data.tar.*
}

package() {
  find -type f -name 'libgcj.so*' \
    -execdir install -Dm755 {} "$pkgdir/usr/lib/{}" \;
}

# vim:set ts=2 sw=2 et:
