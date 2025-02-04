# Maintainer: robertfoster
# Contributor: ajs124 < aur AT ajs124 DOT de >

pkgname=trosh
pkgver=1.2
pkgrel=2
pkgdesc="Trosh: The Movie: The Game"
arch=('any')
url="http://stabyourself.net/$pkgname/"
license=('custom')
depends=('love')
source=(${pkgname}.sh
  ${pkgname}.desktop
  https://github.com/M0Rf30/trosh/archive/$pkgver.tar.gz)

prepare() {
  cd $srcdir/$pkgname-$pkgver
  zip -r ${pkgname}.love *
}
package() {
  cd $srcdir/$pkgname-$pkgver

  # Install Data
  install -D -m755 ${pkgname}.love ${pkgdir}/usr/share/${pkgname}/${pkgname}.love
  # Install Launcher
  install -D -m755 ../${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  # Install Desktop
  install -D -m644 ../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Install Icon
  install -D -m644 graphics/awesome.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  # Install License
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

sha256sums=('7751dd1e04e36d97293a52a2609b4101ac79f9375b84c501929485732a6450fa'
            'be2342ff5aa10f4bdc53a589434e1962f3cf12246ac7801eeabcd47e173ff37b'
            'd10067b716e63f4250bc584fc0e5236d6a96082e50a7322a266cb997f305e143')
