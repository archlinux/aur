# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor: <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: prettyvanilla, rabyte, Marcin Skory

pkgname=alephone-infinity
pkgver=20260930
_pkgver=20250930
pkgrel=1
pkgdesc="Marathon Infinity scenario data files for Aleph One"
arch=('any')
url="https://alephone.lhowon.org/"
license=('custom')
depends=('alephone')
source=("https://github.com/Aleph-One-Marathon/alephone/releases/download/release-$pkgver/MarathonInfinity-$_pkgver-Data.zip"
        "$pkgname.sh"
        "LICENSE" # TODO: clarify where this file comes from
        "$pkgname.desktop")
sha256sums=('f4af33d94ea56af2d53e722bf8870a30794d3611be7b4ed7a5d64bcc2e37e74b'
            '5ec43ca790491113335cc0f22abc2acbf204d9d3551a1b45e41f157753ee826b'
            '0dde70e490e4cb3e262ed7cc4f7ef6bdc49db557a14fc8674de38b2a9a426504'
            '9f0fa2edac76cf9a5d1a4b6c97bdfc040831fb4401f8626be85a0170ec756b25')

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Marathon Infinity" "$pkgdir"/usr/share/AlephOne/scenarios/infinity

  # sane permissions
  find "$pkgdir"/usr/share/AlephOne/scenarios/infinity -type f -exec chmod 644 {} \;

  # launcher script, license and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
