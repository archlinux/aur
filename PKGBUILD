# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=jfdocs-sgml
pkgver=20150504
pkgrel=1
pkgdesc="SGML Documents of Linux JF (Japanese FAQ) Project"
arch=("any")
url="https://linuxjf.osdn.jp/"
license=("custom")
source=("https://linuxjf.osdn.jp/JFdocs/JFsgml.tar.bz2")
md5sums=('41744e437f9bfccef9f8849e1497b855')
makedepends=('curl')

package() {
  _destdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -d "${_destdir}"
  curl -Ls "${url}/copyright.html" -o "${_destdir}/copyright.html"

  _destdir=${pkgdir}/usr/share/doc/jfdocs/sgml
  install -d "${_destdir}"
  cp -r ${srcdir}/JFdocs/. ${_destdir}/.
}
