# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=ignition
pkgname=flattool-ignition
pkgver=1.1.0
pkgrel=1
pkgdesc='Manage your startup apps and scripts on Freedesktop Linux distros'
arch=('any')
url='https://github.com/flattool/ignition'
license=('GPL-3.0-or-later')
depends=('gjs' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/flattool/ignition.git#tag=${pkgver}")
b2sums=('18452beaf6c74625731537cffd7ba3e8fbb36dcf5de3fc3275ecf4435d2de78eb17de97fb64d3ac7fc5fa76a3592e1b945d3743bf16c8cdbdcdc19456f598ada')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
