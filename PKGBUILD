# Maintainer : 3u41c <realmctbf@gmail.com>
# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Tony Lambiris <tony@criticalsstack.com>

pkgname=steinberg-asio
pkgver=2.3.3
_pkgver=${pkgver}_2019-06-14
pkgrel=1
_fullname="asiosdk_${_pkgver}"
pkgdesc="Steinberg's ASIO SDK"
url="http://www.steinberg.net/en/company/developer.html"
arch=('any')
license=('custom')
source=("http://download.steinberg.net/sdk_downloads/${_fullname}.zip")
sha256sums=('80f5bf2703563f6047acec2edd468d0838c9f61eced9f7cdce9629b04e9710ac')

prepare() {
  cd "$srcdir"

  test -d  && rm -f ${_fullname}.zip
  find "$srcdir" -type d -name ${_fullname} -exec cp -a "{}" "$srcdir" \;
}

package() {
  cd "$srcdir"/${_fullname}

  install -d -m755 -p "$pkgdir"/usr/share/licenses/"$pkgname"
  install -m644 *Steinberg\ ASIO\ *\ Licensing\ Agreement*.pdf "$pkgdir"/usr/share/licenses/"$pkgname"
  install -D -m644 common/asio.h "$pkgdir"/usr/include/"$pkgname"/asio.h
}
# vim:set ts=2 sw=2 et:
