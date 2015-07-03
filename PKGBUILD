# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ttf-gentium-basic
pkgver=1.1
_pkgver=110
pkgrel=4
pkgdesc="Fonts based on the original Gentium design with additional weights"
arch=('any')
url="http://scripts.sil.org/Gentium_basic"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('unzip')
install=gentium.install
source=("${pkgname}-${pkgver}.zip::http://scripts.sil.org/cms/scripts/render_download.php?site_id=nrsi&format=file&media_id=GentiumBasic_${_pkgver}&filename=GentiumBasic_${_pkgver}.zip")
md5sums=('44b3bc7b766f411f57e6eae28768dfbb')

package() {
  cd "$srcdir/Gentium Basic $pkgver"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
