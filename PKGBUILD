# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lock
pkgver=1.8.0
pkgrel=1
pkgdesc='Process data with GnuPG 🔒'
arch=('x86_64')
url='https://konstantintutsch.com/Lock/'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/konstantintutsch/Lock.git#tag=v${pkgver}")
b2sums=('fec0e73a34204330cb5f18b6a9cbfbc5b0b5061f9a6f01a89d57bd8065ff089cbd20ff3f2fd6cf9f6a53ee20b2819776127a4631c6ccb2991ab82d724f104781')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
