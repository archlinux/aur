# Maintainer Robert Booster > boosterdev@linuxmail.org

_pkgname=booster-themes
pkgname=booster-gtk-themes
pkgver=1.2
pkgdesc='Booster Themes - Military Edition'
pkgrel=2
arch=('any')
url="https://github.com/boosterdev/booster-themes"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'ttf-ubuntu-font-family')
source=("$_pkgname.$pkgver.tar.gz::https://github.com/boosterdev/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('aefa3eafa414b8efef34754999971f5f706126ef38d75d17b6c9be5afa18e3fb')

build() {
  cd "$_pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
