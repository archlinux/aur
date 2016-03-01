pkgname=pear-merger-git
pkgver=r128.a37a84b
pkgrel=1
pkgdesc="Fast and accurate Illumina Paired-End reAd mergeR"
arch=('x86_64' 'i686')
url="https://github.com/xflouris/PEAR"
license=('CCPL')
makedepends=("git")
source=("git+https://github.com/xflouris/PEAR")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/PEAR"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/PEAR"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/PEAR"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
