# Maintainer: onestone at gmail dot com

pkgname=ttf-input
pkgver=20150316
pkgrel=1
pkgdesc="Fonts for Code, from Font Bureau"
arch=('any')
url="http://input.fontbureau.com/"
license=('custom:Font Software License Agreement')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=()
conflicts=()
source=("Input-Font.zip::http://input.fontbureau.com/build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email=")
sha256sums=('970f4ac3147c92470ccabbb1faf69127e0028142360083cd160fc4af850b86a1')
install=$pkgname.install

package() {
  mkdir -p $pkgdir/usr/share/fonts/TTF
  find $srcdir/Input_Fonts -name '*.ttf' -exec cp {} $pkgdir/usr/share/fonts/TTF \;
	chmod 644 $pkgdir/usr/share/fonts/TTF/*

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
}
