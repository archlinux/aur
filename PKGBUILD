# maintainer: mrtuxa
# contributor: mrtuxa <mrtuxa@infra-sys.de>
# 
pkgname=meson-init-cpp-git
pkgver=0.2
pkgrel=1
pkgdesc="meson init cpp"
arch=('x86_64')
url="https://github.com/mrtuxa/meson-init-cpp"
license=('GPL-3.0')
depends=('meson')
source=("https://github.com/mrtuxa/meson-init-cpp/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a041408864534b4d1b78d3dd8fa8d49c45428fe4dff89750ee893fbc6ed2e5df')

build() {
  cd "${srcdir}/meson-init-cpp-${pkgver}"
  meson setup builddir
  meson compile -C builddir
  ls "${srcdir}/meson-init-cpp-${pkgver}/builddir"
}

package() {
  cd "${srcdir}/meson-init-cpp-${pkgver}"
  install -Dm755 "${srcdir}/meson-init-cpp-${pkgver}/builddir/meson_init_cpp" "${pkgdir}/usr/local/bin/meson-init-cpp"
}
