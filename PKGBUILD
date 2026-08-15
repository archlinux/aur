# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=wikimedia-midi-files
pkgdesc="All MIDI files in the Wikimedia Commons collection."
pkgver=0.1.20200327
pkgrel=2
epoch=
arch=(any)
url="https://commons.wikimedia.org/wiki/Category:MIDI_files"
license=(FDL)
groups=(midi-files)
depends=(jq)
makedepends=('git' 'wget')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("git+https://github.com/aucuparia/commons-category-downloader")
md5sums=('SKIP')

build() {
  cd commons-category-downloader
  ./commons_category_downloader.sh "MIDI files"
}

package() {
  mkdir -p "$pkgdir"/usr/share/midi/wikimedia-midi-files
  cp commons-category-downloader/*.mid "$pkgdir"/usr/share/midi/wikimedia-midi-files/
}
