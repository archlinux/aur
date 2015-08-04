# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * -S defaults to 1:fsyncBeforeClose


pkgname=fs_mark
pkgver=3.3
pkgrel=1
pkgdesc='Filesystem benchmarks'
arch=('x86_64' 'i686')
url='http://sourceforge.net/projects/fsmark/'
license=('GPL2')
source=("http://downloads.sourceforge.net/project/fsmark/fsmark/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a31ac6f127a46ee45a33e4ce86c65553')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Its makefile doesn't have an install
  install -Dm755 lib_timing.o "${pkgdir}/usr/lib/lib_timing.o"
  install -Dm755 fs_mark "${pkgdir}/usr/bin/fs_mark"
  install -Dm644 README "${pkgdir}/usr/share/${pkgname}/README"
  install -Dm644 plot_test "${pkgdir}/usr/share/${pkgname}/gnuplot_example"
}
