# Maintainer:
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: YamashitaRen <lemaitre(dot)lotus(at)gmail(dot)com>

_pkgname="geany-highlightselectedword"
pkgname="$_pkgname"
pkgver=20160801
pkgrel=3
pkgdesc="Geany plugin that highlights all instances of the currently selected word"
url="https://sourceforge.net/projects/geanyhighlightselectedword/"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'geany'

  ## implicit
  #at-spi2-core
  #cairo
  #gdk-pixbuf2
  #glib2
  #gtk3
  #harfbuzz
  #pango
  #zlib
)

_pkgsrc="GeanyHighlightSelectedWord_2016-08-01T00-53-19"
source=("https://downloads.sourceforge.net/project/geanyhighlightselectedword/GeanyHighlightSelectedWord_2016-08-01T00-53-19.zip")
sha256sums=('ab9d8dd680c8b446e4433bec5c3c2a329d30c1b65c2e2ecdaff95444454acfcd')

prepare() {
  cd "$_pkgsrc"
  sed -E -e 's&\bconst const\b&const&' -i GeanyHighlightSelectedWord.c
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"

  install -Dm644 GeanyHighlightSelectedWord.so "$pkgdir/usr/lib/geany/GeanyHighlightSelectedWord.so"
}
