# Maintainer:
# Contributor: Guillaume Hayot <ghayot@postblue.info>

_pkgname="parlatype"
pkgname="$_pkgname"
pkgver=4.2
pkgrel=2
pkgdesc="GNOME audio player for transcription"
url="https://github.com/gkarsay/parlatype"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'gtk4'
  'libadwaita'
)
makedepends=(
  'cmake'
  'glib2-devel'
  'itstool'
  'meson'
)
optdepends=(
  'parlatype-libreoffice-extension: LibreOffice macros'
)

_pkgsrc="$pkgname-$pkgver"
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1d1e0aaac795249ab95ca393a17a99d9f721d7a99905acadc794eb16f8f5b538')

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
