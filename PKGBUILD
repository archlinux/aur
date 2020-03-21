# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Elena ``of Valhalla'' Grandi <gmail.com: elena.valhalla>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgbase=font-symbola
#pkgname=('ttf-symbola' 'otf-symbola')
pkgname=('otf-symbola')
pkgver=13.00
pkgrel=1
pkgdesc="Font for symbol blocks of the Unicode Standard"
arch=('any')
url="https://dn-works.com/ufas/"
license=('custom')
makedepends=('fontforge')
source=("${pkgbase}-${pkgver}.zip::https://dn-works.com/wp-content/uploads/2020/UFAS-Fonts/Symbola.zip"
        "LICENSE")
sha512sums=('57f1c72d9fe03da68fee476f6c3d202805ba5eacfb4690ca5e3b10d4d335cbefaebd501f77af28abc2a71cd34a926a79d633689ff8cb54e972d09b5292f5c8b1'
            '9afe91785611955511248fd31a86c7e370b23b1b2c37f9345c8f274b3e0e1dbf9c0da8f9edac62d27d318e56485b80966aa7622f167f4da5d5925a7935bfa3da')

build() {
  fontforge -c 'open(argv[1]).generate(argv[2])' Symbola.otf Symbola.ttf
}

#package_ttf-symbola() {
#  conflicts=('ttf-symbola-ib')
#  provides=('ttf-symbola')
#  pkgdesc+=" (TTF)"
#  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/Symbola.ttf" Symbola.ttf
#  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
#}

package_otf-symbola() {
  provides=('otf-symbola')
  pkgdesc+=" (OTF)"
  install -Dm644 Symbola.otf "$pkgdir/usr/share/fonts/OTF/Symbola.otf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
