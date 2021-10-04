#Maintainer: Sanskrit Coders <sanskrit-programmers@googlegroups.com>
pkgname=stardict-indic-update
pkgver=1.0
pkgrel=1
pkgdesc="Stardict dictionaries (see url for details): Sanskrit, Pali, Malayalam, Kannada, Tamil, Telugu, Bengali, Oriya, Hindi, Nepali, Gujarati, Marathi, Punjabi, Sinhala, Assamese, English, Latin..."
url="http://github.com/indic-dict/stardict-indic-update-aur"
# license=('custom:OFL')
arch=(any)
makedepends=('wget')

# source=("")
# sha256sums=('')

build() {
  wget -N https://github.com/sanskrit-coders/dict-tools/raw/master/bin/artifacts/dict-tools.jar
}

package() {
  install -d "$pkgdir/usr/share/dictionaries/"
  java -jar "$srcdir/dict-tools.jar" install  --destinationPath "$pkgdir/usr/share/dictionaries" --dictRepoIndexUrl https://raw.githubusercontent.com/indic-dict/stardict-index/master/dictionaryIndices.md --overwrite true
}

depends=(
)

optdepends=(
'goldendict'
'stardict-tools'
)