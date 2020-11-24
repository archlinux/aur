# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext-git
pkgver=1.2.0
epoch=1
pkgrel=3
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext.git"
provides=('textext')
conflicts=('textext')
makedepends=('git')
depends=('inkscape' 'python-gobject' 'texlive-core' 'python-lxml')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |tr - .
}

package() {
  cd ${pkgname%-git}
  python setup.py --inkscape-extensions-path="$pkgdir"/usr/share/inkscape/extensions/
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt 
  rm -rf "$pkgdir/usr/share/inkscape/extensions/textext/__pycache__"
}



