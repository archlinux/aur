# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Luis Medina <noxein@yahoo.com>

pkgname=alephone-evil
pkgver=1.0
pkgrel=2
pkgdesc="A radical new scenario for the AlephOne engine"
arch=('any')
url="http://trilogyrelease.bungie.org/"
license=('unknown')
depends=('alephone')
source=("http://files3.bungie.org/trilogy/MarathonEvil.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('25ade4be0e9f0a4456511830e1abf55f48a095390bae8cef02a16771e5fad122'
            '298cd98fc67350c9462d7962fd95db21451db2adc21716c88342a1bf5942b0af'
            '287df7f3c6e4b8fd3161fd0a62c01de35525613f857568073c2213d263b0aec9')

prepare() {
  rm -rf "Marathon EVIL"/Themes/Default/CVS
}

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/alephone/scenarios
  cp -r "Marathon EVIL" "$pkgdir"/usr/share/alephone/scenarios/evil

  # sane permissions
  find "$pkgdir"/usr/share/alephone/scenarios/evil -type f -exec chmod 644 {} \;

  # launcher script and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
