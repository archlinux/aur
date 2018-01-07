# $Id: PKGBUILD 195808 2016-11-14 17:27:06Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=pnews
pkgver=2.6.5
_pkgver=265
pkgrel=5
pkgdesc="A PHP web-based NNTP client"
arch=('any')
url="http://sourceforge.net/projects/pnews"
license=('GPL')
depends=('php')
backup=('etc/webapps/pnews/.htaccess')
source=(https://downloads.sourceforge.net/sourceforge/pnews/pnews${_pkgver}.tgz)
sha256sums=('373fe4263973da78a8863b14140f73d3c7bad335a32523d02b01936e3772e357')

package() {
  _instdir="$pkgdir"/usr/share/webapps/pnews
  mkdir -p ${_instdir} "$pkgdir"/etc/webapps/pnews
  cd ${_instdir}
  cp -ra "$srcdir"/pnews${_pkgver}/* .
  echo "deny from all" >"$pkgdir"/etc/webapps/pnews/.htaccess
  ln -s /etc/webapps/pnews/.htaccess .htaccess
}
