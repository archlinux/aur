# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=jfdocs-text
pkgver=20150504
pkgrel=1
pkgdesc="Text Documents of Linux JF (Japanese FAQ) Project"
arch=("any")
url="https://linuxjf.osdn.jp/"
license=("custom")
source=("https://linuxjf.osdn.jp/JFdocs/JFtxt.tar.bz2")
md5sums=('70e149f56ae7f369b68bc6f2ffc2240f')
makedepends=('curl')

package() {
  _destdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -d "${_destdir}"
  curl -Ls "${url}/copyright.html" -o "${_destdir}/copyright.html"

  _destdir=${pkgdir}/usr/share/doc/jfdocs/text
  install -d "${_destdir}"
  cp -r ${srcdir}/JFdocs/. ${_destdir}/.
}
