# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: rabyte <rabyte__gmail>
# Contributor: Marcin Skory <armitage at q84fh dot net>

pkgname=alephone-marathon2
pkgver=20140104
pkgrel=2
pkgdesc="Marathon 2 scenario data files for Aleph One"
arch=('any')
url="http://marathon.sourceforge.net"
license=('custom')
depends=('alephone')
conflicts=('alephone-highres')
source=(Marathon2-$pkgver-Data.zip::"http://marathon.sourceforge.net/download/data.php?game=marathon2"
        "$pkgname.sh"
        "LICENSE" # TODO: clarify where this file comes from
        "$pkgname.desktop")
sha256sums=('9bb2dc6a808ec13502b52f72ee2e44411f09977ff0d95f29e2a2488388969bd0'
            '906e1acbe135bdd4f9310928b965e184451cdf600bac892b823469cf5273a5b3'
            '0dde70e490e4cb3e262ed7cc4f7ef6bdc49db557a14fc8674de38b2a9a426504'
            '766f2e8b15a6754906bd136984199f4088a402ce08320ae23b630998975466aa')

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/alephone/scenarios
  cp -r "Marathon 2" "$pkgdir"/usr/share/alephone/scenarios/marathon2

  # sane permissions
  find "$pkgdir"/usr/share/alephone/scenarios/marathon2 -type f -exec chmod 644 {} \;

  # launcher script, license and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
