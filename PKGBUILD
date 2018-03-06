# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
pkgver=0.7
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="http://pav.iki.fi/software/textext/"
depends=('inkscape' 'texlive-core' 'python2')
optdepends=('pdf2svg' 'pygtk')
source=("https://bitbucket.org/pitgarbe/textext/downloads/TexText-Linux-0.7.tgz")
md5sums=('ddeddf0f4bb3af5d497389c913ba0145')
prepare() {
  sed -i '1s|python\>|python2|' $pkgname-$pkgver-linux/extension/textext.py
}

package() {
  cd $pkgname-$pkgver-linux/extension
  install -d "$pkgdir"/usr/share/inkscape/extensions
  for _i in asktext.py default_packages.tex latexlogparser.py textext.{inx,py} typesetter.py win_app_paths.py
  do install ${_i} "$pkgdir"/usr/share/inkscape/extensions/$_i
  done
  cd ..
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  
}

