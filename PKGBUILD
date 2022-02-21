# Maintainer: Hekuran https://github.com/narukeh
# Contributor: Ondřej Šponar
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lexend-deca-git
pkgver=r105.57e6c14
pkgrel=1
epoch=1
pkgdesc='Its a variable ttf typeface designed to improve reading fluency. Only Deca size in all its variations.'
url="https://lexend.com"
arch=(any)
license=(custom:OFL-1.1)
makedepends=('git')
conflicts=('lexend-fonts' 'lexend-fonts-git')
provides=('lexend-fonts')
source=('lexend-deca-git::git+https://github.com/googlefonts/lexend')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  for file in $pkgname/fonts/deca/ttf/* ; do install -Dm644 "$file" "$pkgdir/usr/share/fonts/TTF/$file" ; done
  install -Dm644 $pkgname/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
