# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mp3wrap"
pkgname="${_pkgname}-bin"
pkgver=0.5
pkgrel=1
pkgdesc="Tool for wrapping mp3 files. A free independent alternative to AlbumWrap"
arch=('i686')
url="https://${_pkgname}.sourceforge.net"
license=('LGPL-3.0-or-later')
depends=('lib32-glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_i686=("${_pkgsrc}-i686.deb::https://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}_${pkgver}-1_i386.deb")
sha256sums_i686=('acce5b4c37fa224f2f6b349d3c43e7e644589e22d55271d4fbb3ad688e98ee4a')

prepare() {
  cd "${srcdir}"
  tar xf "data.tar.gz"
}

package() {
  cd "${srcdir}/usr"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "share"
  install -Dm644 "man/man1/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

  cd "doc/${_pkgname}"
  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 "faq.html"  "${pkgdir}/usr/share/doc/${_pkgname}/faq.html"
  install -Dm644 "copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
}
