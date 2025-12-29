# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lock
pkgver=1.9.3
pkgrel=1
pkgdesc='Process data with GnuPG 🔒'
arch=('x86_64')
url='https://konstantintutsch.com/Lock/'
license=('MIT')
depends=('gpgme' 'gtk4' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/konstantintutsch/Lock.git#tag=v${pkgver}")
b2sums=('bcdfcb4de5b44431a6e50682a635b534000f55b65f48a9ce82257bb5316a28693cdac05333b7e4ab0932437ffc65984eaa5a4b08de8839a37c56215dd838fe9e')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
