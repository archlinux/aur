# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_fontname=bitter
pkgname=otf-${_fontname}
pkgver=1.300
pkgrel=1
pkgdesc='A font specially designed for comfortably reading on any computer or device.'
arch=('any')
url="http://www.huertatipografica.com/fonts/${_fontname}-ht"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
conflicts=('otf-google-fonts-hg')
source=("${_fontname}.zip::http://www.fontsquirrel.com/fonts/download/${_fontname}")
sha256sums=('c41d2af90c73dd8dd9f691feba513fea943caffef8f76aa4755e0ae1e2f48de9')

package() {
  install -Dm644 "SIL Open Font License.txt" "$pkgdir"/usr/share/licenses/${pkgname}/OFL
  install -d "$pkgdir"/usr/share/fonts/OTF/
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}
