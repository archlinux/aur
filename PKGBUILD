# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Tony Lambiris <tony@criticalsstack.com>

pkgname=steinberg-asio
pkgver=2.3.1
pkgrel=1

pkgdesc="Steinberg's ASIO SDK"
url="http://www.steinberg.net/en/company/developer.html"
arch=('any')
license=('custom')

source=("http://www.steinberg.net/sdk_downloads/ASIOSDK${pkgver}.zip")
sha256sums=('31074764475059448a9b7a56f103f4723ed60465e0e9d1a9446ca03dcf840f04')

prepare() {
  cd "$srcdir"

  test -d ASIOSDK2.3.1 && rm -f ASIOSDK2.3.1
  find "$srcdir" -type d -name ASIOSDK2.3.1 -exec cp -a "{}" "$srcdir" \;
}

package() {
  cd "$srcdir"/ASIOSDK2.3.1

  install -d -m755 -p "$pkgdir"/usr/share/licenses/"$pkgname"
  install -m644 Steinberg\ ASIO\ Licensing\ Agreement.pdf "$pkgdir"/usr/share/licenses/"$pkgname"
  install -D -m644 common/asio.h "$pkgdir"/usr/include/"$pkgname"/asio.h
}
# vim:set ts=2 sw=2 et: