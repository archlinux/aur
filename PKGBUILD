# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=otf-lintel
_pkgname=Lintel
pkgver=3
pkgrel=1
pkgdesc="A modern san serif typeface with a pure clean line form."
arch=('any')
license=('custom:EULA')
url="http://www.thenorthernblock.co.uk/lintel.htm"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
optdepends=()
install=otf.install
source=('http://www.thenorthernblock.co.uk/download/4fe1de01-1c4c-4722-b08c-742dd1768ca6' 'http://www.thenorthernblock.co.uk/download/4fe1ddd1-3d70-4fe2-92f7-73fad1768ca6')

md5sums=('52641d901385c2e675038a5856aee8ad'
         '8aeea1aa946dc4cd9dd809d8a30ecec3')

package() {
  mv "4fe1ddd1-3d70-4fe2-92f7-73fad1768ca6" "${_pkgname}_Regular.otf"
  mv "4fe1de01-1c4c-4722-b08c-742dd1768ca6" "${_pkgname}_Italic.otf"
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/OTF/
  install -m644 *.otf $pkgdir/usr/share/fonts/OTF/ || return 1
  #install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
