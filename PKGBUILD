# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=skeuowaita-git
pkgver=r78.83b953f
pkgrel=2
pkgdesc="A skeuomorphic take on the Adwaita theme"
arch=(any)
url="https://github.com/Frostbitten-jello/Skeuowaita"
license=('custom')
depends=(adwaita-icon-theme)
provides=(skeuowaita)
conflicts=(skeuowaita)
source=("$pkgname"::"git+$url")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir"/usr/share/icons/Skeuowaita
  mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"

  cp -t "$pkgdir"/usr/share/icons/Skeuowaita/ -r index.theme scalable/ Extras/
  cp -t "$pkgdir"/usr/share/licenses/"$pkgname"/ LICENSE*
}
