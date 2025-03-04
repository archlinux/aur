# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lptk
pkgver=0.1.0
pkgrel=1
pkgdesc='Stateless password manager'
arch=('aarch64' 'x86_64')
url='https://gitlab.com/ogarcia/lptk'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'rust')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
source=("${pkgname}::git+https://gitlab.com/ogarcia/lptk.git#tag=${pkgver}")
b2sums=('9f9fcb56b45f95d59c09e60aefae488b05de1c3195b70238f087e928e4cd478ca2446ff3f4353d37ce70ae02705c480a9da31849e6be54894acede5331f9294f')

build() {
  mkdir -p "${srcdir}"/output
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
