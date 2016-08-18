# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=html-tidy
pkgver=5.2.0
pkgrel=1
pkgdesc="HTML5 formatter"
arch=(i686 x86_64)
license=('custom')
url="https://github.com/htacg/tidy-html5"
makedepends=('git')
source=("git+git://github.com/htacg/tidy-html5#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/tidy-html5/build/cmake"

  cmake ../.. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/tidy-html5/build/cmake"

  make "DESTDIR=${pkgdir}" install
  install -Dm644 ../../README/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
