# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
pkgver=0.4.4
pkgrel=5
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="http://pav.iki.fi/software/textext/"
depends=('inkscape' 'texlive-core' 'python2')
optdepends=('pdf2svg')
source=("http://pav.iki.fi/_downloads/$pkgname-$pkgver.tar.gz" LICENSE.txt)
md5sums=('5dbb18bf762565196f8ac1f68f8607e3'
         '91da7de463147c1c78b1c2e6f24da380')
prepare() {
  sed -i '1s|python\>|python2|' textext.py
}

package() {
      cd "$srcdir"
      install -Dm 644 LICENSE.txt \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
      install -Dm 755 textext.py \
	"${pkgdir}/usr/share/inkscape/extensions/textext.py"
      install -Dm 644 textext.inx \
	"${pkgdir}/usr/share/inkscape/extensions/textext.inx"
    }

