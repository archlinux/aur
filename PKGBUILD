# Maintainer : boronology <boronology at gmail dot com>
pkgname=otf-source-han-code-jp
pkgver=2.012
pkgrel=1
depends=('fontconfig' 'xorg-mkfontscale')
pkgdesc="Japanese OpenType font for developers. Made by mixing SourceHanSans and SourceCodePro"
arch=('any')
license=('custom')
url="https://github.com/adobe-fonts/source-han-code-jp"
source=("https://github.com/adobe-fonts/source-han-code-jp/archive/2.012R.tar.gz")

install=$pkgname.install

package() {
	  # install fonts
	  cd "$srcdir"/source-han-code-jp-2.012R/

	  #install OpenType Fonts
	  for OTF in $(ls OTF/*.otf); do
	      install -Dm644 $OTF "$pkgdir/usr/share/fonts/$OTF"
    done
	  
	  # install License
	  cd "$srcdir"/source-han-code-jp-2.012R/
	  install -Dm644 LICENSE.txt \
	  	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

md5sums=('1de1386bdcc357d9939d7352234945f9')
