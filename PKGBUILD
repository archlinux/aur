# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=jfdocs-html
pkgver=20150504
pkgrel=2
pkgdesc="HTML Documents of Linux JF (Japanese FAQ) Project"
arch=("any")
url="https://linuxjf.osdn.jp/"
license=("custom")
source=("https://linuxjf.osdn.jp/JFdocs/JFhtml.tar.bz2")
md5sums=('36494ad47bc6f2d8029e47186cc7c8e3')
makedepends=('curl')

package() {
  _destdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -d "${_destdir}"
  curl -Ls "${url}/copyright.html" -o "${_destdir}/copyright.html"

  _destdir=${pkgdir}/usr/share/doc/jfdocs/html
  install -d "${_destdir}"
  cp -r ${srcdir}/JFdocs/. ${_destdir}/.
}
