# Mantainer: edison_Liu < liushuai05 at github/gitee >

pkgname=libcapi-gitee
pkgver=3.2.3
pkgrel=2
pkgdesc="Modular libcapi20"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')
conflicts=(isdn4k-utils)
makedepends=(meson git)
options=('!emptydirs')

source=(
  "git+https://gitee.com/liushuai05/${pkgname}.git#tag=v${pkgver}"
)
sha512sums=(
  'SKIP'
)

build() {
  cd "${srcdir}/${pkgname}"
  meson --prefix /usr --buildtype=plain "builddir"
  ninja -v -C "builddir"
}

check() {
  cd "${srcdir}/${pkgname}"
  ninja -C "builddir" test
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" ninja -C "builddir" install
}
