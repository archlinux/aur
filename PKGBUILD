# Maintainer:
# Contributor: Guillaume Hayot <ghayot@postblue.info>

_pkgname="parlatype"
pkgname="$_pkgname"
pkgver=4.3
pkgrel=1
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
sha256sums=('b942ec53d93cf823ebbbe9153c7b5855f404d4ac4680881dc921f490ec59dda7')

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
