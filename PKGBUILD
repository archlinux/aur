# Maintainer: Lara Maia <dev@lara.click>
# co-Maintainer: Acidhub <contact@acidhub.click>
# co-Maintainer: bobi
# Contributer: Jean-Alexandre Anglès d'Auriac <jagw40k@free.fr>

pkgname=buuf-icon-theme
pkgdesc="An icon theme for Gnome based on the Buuf iconset by Mattahan"
pkgver=3.34
pkgrel=1
arch=('any')
url="http://buuficontheme.free.fr"
license=('cc-by-nc-sa')

depends=('hicolor-icon-theme')
makedepends=('pup')

plingurl="https://www.pling.com/dl?file_id=1572174181&file_type=application/x-xz&file_name=buuf$pkgver.tar.xz&file_size=21660564&project_id=1012512&link_type=download&is_external=false&external_link=null"
source=($(curl -sX POST $plingurl | pup -i 0 '.empty-action > script' | sed '2q;d' | sed 's/^[^"]*"//' | sed 's/".*$//'))

#source=(buuf$pkgver.tar.xz)

package() {
  mkdir -p "$pkgdir"/usr/share/icons/$pkgname/
  cp -rf "$srcdir"/buuf$pkgver/* "$pkgdir"/usr/share/icons/$pkgname/
}
md5sums=('0edbcd3d019d4a9b5fc0478168aac263')
