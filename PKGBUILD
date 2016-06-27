# Maintainer: Munzir Taha <munzirtaha at gmail.com>
# Contributor: Wyegu <bsdazs17 at gmail dot com>
# Contributor: Firmicus <firmicus at gmx dot net>

pkgname=ttf-sil-scheherazade
pkgver=2.100
pkgrel=1
pkgdesc="A font designed in a similar style to traditional Naskh typefaces"
arch=('any')
url="http://software.sil.org/scheherazade/"
license=('custom:OFL')
install=$pkgname.install
source=('http://software.sil.org/downloads/scheherazade/Scheherazade-2.100.zip')
sha256sums=('251c8817ceb87d9b661ce1d5b49e732a0116add10abc046be4b8ba5196e149b5')

package() {
  # Font installation
  cd "$srcdir/Scheherazade-$pkgver"
  install -d ${pkgdir}/usr/share/fonts/TTF 
  install -m 644 Scheherazade-Regular.ttf Scheherazade-Bold.ttf ${pkgdir}/usr/share/fonts/TTF/

  # license
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 OFL.txt OFL-FAQ.txt ${pkgdir}/usr/share/licenses/${pkgname}/

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 README.txt FONTLOG.txt documentation/Scheherazade-features.{pdf,odt} documentation/DOCUMENTATION.txt "$pkgdir/usr/share/doc/$pkgname/"

}
