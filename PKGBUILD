# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: <AttilaH©web.de>

pkgname=otf-latin-modern
pkgver=2.004
pkgrel=2
pkgdesc='Improved version of Computer Modern fonts as used in LaTeX'
arch=('any')
url='http://www.gust.org.pl/projects/e-foundry/latin-modern'
license=('custom:GFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.gust.org.pl/projects/e-foundry/latin-modern/download/lm${pkgver}otf.zip"
        "GUST-FONT-LICENSE.txt::http://www.gust.org.pl/projects/e-foundry/licenses/GUST-FONT-LICENSE.txt/at_download/file")
sha256sums=('5b0236051d3728be6616f1b274e3b910473875b5a3ef9382f0ef00384ddb161b'
            'a746108477b2fa685845e7596b7ad8342bc358704b2b7da355f2df0a0cb8ad85')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 GUST-FONT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/GUST-FONT-LICENSE.txt"
}
