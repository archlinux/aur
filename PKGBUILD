# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=man-pages-ru
pkgver=4.15_2383_2383_20180113
pkgrel=1
pkgdesc="Russian Linux man pages"
arch=(any)
url="https://sourceforge.net/projects/man-pages-ru/"
depends=(man)
license=('FDL')
source=(http://downloads.sourceforge.net/project/man-pages-ru/man-pages-ru_${pkgver//_/-}.tar.bz2)
sha256sums=('af0c39e68ff378be3331a676c5f9bdd3f6ee553d338ca0ee8374204b1f936810')

package() {
  cd "$srcdir"/man-pages-ru_${pkgver//_/-}
  mkdir -p "$pkgdir"/usr/share/man/ru
  mv man* "$pkgdir"/usr/share/man/ru/
  cd "$pkgdir"/usr/share/man/ru
  # this is included in shadow
  rm -f man5/passwd.5*
  rm -f man3/getspnam.3*
  find . -type d -exec chmod 0755 {} \;
  find . -type f -exec chmod 0644 {} \;
}
