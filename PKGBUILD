# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=vardefm-bin
_pkgname=vardefm
pkgver=0.3.1
pkgrel=1
pkgdesc="Open high-speed data modem for FM radios (VARA FM alternative) — binary release"
arch=('x86_64')
url="https://github.com/notepid/vardeFM"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'glibc')
provides=('vardefm')
conflicts=('vardefm')
source=("https://github.com/notepid/vardeFM/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4a5f48481c48311975b4e309094269c07b4d4466a01e03ee441ff729626004e7')

package() {
  cd "${_pkgname}_${pkgver}_linux_amd64"
  install -Dm755 vardefm "$pkgdir/usr/bin/vardefm"
  install -Dm644 99-vardefm-cm108.rules "$pkgdir/usr/lib/udev/rules.d/99-vardefm-cm108.rules"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 docs/RADIO.md "$pkgdir/usr/share/doc/$_pkgname/RADIO.md"
  install -Dm644 docs/PROTOCOL.md "$pkgdir/usr/share/doc/$_pkgname/PROTOCOL.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
