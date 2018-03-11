# Maintainer: Beshr Kayali <me at beshr.com>

pkgname=ttf-sil-kawkab-mono
pkgver=0.500
pkgrel=1
pkgdesc="A monospaced Arabic typeface."
arch=('any')
url="https://makkuk.com/kawkab-mono/"
license=('custom:OFL')
source=('https://makkuk.com/kawkab-mono/downloads/kawkab-mono-0.500.zip')
sha256sums=('2c96c5ddfe952b46baf8894112c4e675e7aa34542380d6223021a8d4b378e3a0')

package() {
  # Font installation
  cd "$srcdir/kawkab-mono-$pkgver"
  install -d ${pkgdir}/usr/share/fonts/TTF 
  install -m 644 KawkabMono-Light.ttf KawkabMono-Bold.ttf KawkabMono-Regular.ttf ${pkgdir}/usr/share/fonts/TTF/

  # license
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m 644 README release-notes.md "$pkgdir/usr/share/doc/$pkgname/"
}
