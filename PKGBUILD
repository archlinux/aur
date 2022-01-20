# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=man-pages-ru
pkgver=5.03_2390_2390_20191017
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Russian Linux man pages"
arch=(any)
url="https://sourceforge.net/projects/man-pages-ru/"
depends=(man)
license=(FDL)
source=(http://downloads.sourceforge.net/project/man-pages-ru/man-pages-ru_${_pkgver}.tar.bz2)
sha256sums=('ebe3b9ecc6d3faba607d82eeb174f565588ddd2e2ff5b599958d109f11965f5a')

package() {
  cd "${srcdir}"/man-pages-ru_${_pkgver}

  mkdir -p "${pkgdir}"/usr/share/man/ru
  mv man* "${pkgdir}"/usr/share/man/ru/

  # this is included in shadow
  cd "${pkgdir}"/usr/share/man/ru

  rm -f man5/passwd.5*
  rm -f man3/getspnam.3*

  find . -type d -exec chmod 0755 {} \;
  find . -type f -exec chmod 0644 {} \;
}
