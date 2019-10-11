# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=man-pages-ru
pkgver=5.03_2389_2389_20190927
pkgrel=1
pkgdesc="Russian Linux man pages"
arch=(any)
url="https://sourceforge.net/projects/man-pages-ru/"
depends=(man)
license=('FDL')
source=(http://downloads.sourceforge.net/project/man-pages-ru/man-pages-ru_${pkgver//_/-}.tar.bz2)
sha256sums=('d36e64fd4bfbf955d0b5afe3c3d689a74b50a465cfe8b966a40dcda8417422ce')

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
