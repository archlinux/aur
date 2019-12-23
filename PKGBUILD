# Maintainer: Renat Nasridinov <mavladi@gmail.com>

pkgname=otf-arsenal
_gitname=Arsenal
pkgver=VERSION
pkgrel=1
pkgdesc="Typesetting font with semi grotesque traditional Ukrainian forms"
arch=('any')
url="https://github.com/alexeiva/Arsenal"
license=('custom:SIL Open Font License 1.1')
install=otf-arsenal.install
source=("git+https://github.com/alexeiva/Arsenal.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "$srcdir/$_gitname"/fonts/otf/*.otf "${pkgdir}/usr/share/fonts/OTF/"
  cd ..
  install -d "$pkgdir/usr/share/doc/${_gitname}/"
  install -D -m644 "$srcdir/$_gitname"/README.md "$pkgdir/usr/share/doc/${_gitname}/"
}
