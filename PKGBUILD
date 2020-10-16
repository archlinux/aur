# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=srs-state-threads
pkgver=1.9.1
pkgrel=1
pkgdesc="Fork of state-threads, patched for SRS"
arch=('x86_64')
url="https://github.com/ossrs/state-threads/"
license=('GPL2' 'MPL')
source=("git+https://github.com/ossrs/state-threads/#commit=29472f83ce03bd55770df929e5bd0af99c43988d")
sha256sums=('SKIP')

build() {
  cd "${srcdir}"/state-threads
  make linux-optimized
}

package() {
  cd "${srcdir}"/state-threads/LINUX_*_OPT
  install -Dm644 st.h "${pkgdir}"/usr/include/st.h
  install -Dm644 libst.a "${pkgdir}"/usr/lib/libst.a
  install -Dm755 libst.so.1.9 "${pkgdir}"/usr/lib/libst.so.1.9
  ln -s libst.so.1.9 "${pkgdir}"/usr/lib/libst.so.1
  ln -s libst.so.1.9 "${pkgdir}"/usr/lib/libst.so
}
