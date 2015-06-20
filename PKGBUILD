# Maintainer : boronology <boronology at gmail dot com>
pkgname=otf-source-han-code-jp
pkgver=1.004
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Japanese OpenType font for developers by mixing Source Han Sans and Source Code Pro"
arch=('any')
license=('custom')
url="https://github.com/adobe-fonts/source-han-code-jp"
source=("https://github.com/adobe-fonts/source-han-code-jp/archive/1.004R.tar.gz")

install=$pkgname.install

package() {
	  # install fonts
	  cd "$srcdir"/source-han-code-jp-1.004R/OTF/SourceHanCodeJP/

	  for OTF in `ls *.otf`
	      do
	      install -Dm644 $OTF "$pkgdir/usr/share/fonts/OTF/$OTF"
	      done

	  # install License
	  cd "$srcdir"/source-han-code-jp-1.004R/
	  install -Dm644 LICENSE.txt \
	  	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

md5sums=('81593bcb80f33b7c5d57b827bbf35165')
