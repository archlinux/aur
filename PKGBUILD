# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="waysip"
pkgname="${_pkgname}"
pkgver=0.6.1
pkgrel=1
pkgdesc="A wayland-native, blazing-fast area selection tool"
arch=("x86_64")
url="https://github.com/waycrate/waysip"
license=('MIT')
depends=(wayland pango cairo glib2)
makedepends=(cargo)
provides=(${_pkgname})
conflicts=("${_pkgname}-git")
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c7685165ec79a068cd1f34a5002cf95f97d0ffed0f8706940737850196edf2b3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}
