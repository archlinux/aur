# Contributor: Andrew Rabert <draje@nullsum.net>
# Maintainer: Tun Win Naing <tunwn.mdy@gmail.com>

pkgname=tamzen-font
pkgver=1.11.5
pkgrel=1
pkgdesc="Bitmapped programming font, based on Tamsyn (powerline, bitmap, ttf, vconsole font)"
arch=('any')
url="https://github.com/sunaku/tamzen-font"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=tamzen-font.install
source=("https://github.com/sunaku/tamzen-font/archive/Tamzen-${pkgver}.tar.gz")
sha256sums=('78d39f481bcb1011ea6c2f80259c4f2cd08147f9948f4d19e42c418c23b8518d')

_srcname="tamzen-font-Tamzen-${pkgver}"

package () {
  cd "${srcdir}/${_srcname}"

  install -d "${pkgdir}/usr/share/fonts/local"
  install -m644 bdf/*.bdf "${pkgdir}/usr/share/fonts/local/"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -d "${pkgdir}/usr/share/kbd/consolefonts"
  gzip psf/*.psf
  install -m644 psf/*.psf.gz "${pkgdir}/usr/share/kbd/consolefonts/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"

}
