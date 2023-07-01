# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname="blueprint-compiler"
pkgname="blueprint-compiler-health"
_commit="93f2a27e"
_pkgver=0.8.1
pkgver="${_pkgver}+${_commit}"
pkgrel=1
_ns=jwestman
pkgdesc='A markup language for GTK user interfaces'
url="https://${_ns}.pages.gitlab.gnome.org/${_pkgname}"
license=(LGPL)
arch=(any)
depends=(
  python-gobject
)
makedepends=(
  meson
)
_commit="93f2a27e"
_repo_url="https://gitlab.gnome.org/${_ns}/${_pkgname}"
source=(
  "git+${_repo_url}#commit=${_commit}")
sha256sums=(
  'SKIP')

build() {
  arch-meson "${_pkgname}" build --prefix=/usr
  meson compile -C build
}

package() {
  provides=("${_pkgname}=${pkgver}")
  conflicts=("${_pkgname}")
  meson install -C build --destdir "${pkgdir}"
}
