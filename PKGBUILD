# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=man-pages-ru
pkgver=4.17_2385_2385_20181124
pkgrel=1
pkgdesc="Russian Linux man pages"
arch=(any)
url="https://sourceforge.net/projects/man-pages-ru/"
depends=(man)
license=('FDL')
source=(http://downloads.sourceforge.net/project/man-pages-ru/man-pages-ru_${pkgver//_/-}.tar.bz2)
sha256sums=('0d1b57ea0f2ff96d5d77fdc7ad22959909a16705a41faeb9a2aeef5d0e6bbe58')

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
