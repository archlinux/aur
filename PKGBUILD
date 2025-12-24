# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lock
pkgver=1.9.2
pkgrel=1
pkgdesc='Process data with GnuPG 🔒'
arch=('x86_64')
url='https://konstantintutsch.com/Lock/'
license=('MIT')
depends=('gpgme' 'gtk4' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/konstantintutsch/Lock.git#tag=v${pkgver}")
b2sums=('973ed8bc487128c657ae8ef3b997353f791795c2975caf04be44bdf6b87084ba7a4c6ee21318e616b3deba8e1fe01f8739238d7cec94fd3a3b7b25812195da58')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
