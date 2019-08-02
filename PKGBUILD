# Maintainer:  <fr@nz>
pkgname=otf-anrt-baskervville
_pkgname=ANRT-Baskervville
pkgver=r15.63b665c
pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="evival of Jacob's revival of Baskerville's typeface designed by ANRT students in 2017-2018"
arch=('any')
url="https://github.com/anrt-type/ANRT-Baskervville"
license=('OFL')
source=("git+https://github.com/anrt-type/$_pkgname")
sha1sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"

  # actual data
  install -Dt "$pkgdir"/usr/share/fonts/OTF/ fonts/Baskervville_OTF/*.otf

  # license file
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE LICENSE.txt
 
}

# vim:set ts=2 sw=2 et:
