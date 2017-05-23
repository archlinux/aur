
# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

_pkgbase=hardcode-tray
_gitname=Hardcode-Tray
pkgname=$_pkgbase
pkgver=3.8
pkgrel=1
pkgdesc="Fixes Hardcoded Tray Icons"
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/${_gitname}"
license=('GPL')
provides=("$_pkgbase")
conflicts=("hardcode-tray-fixer-git" "hardcode-tray-git")
depends=('python' 'python-gobject' 'python-cairosvg' 'librsvg' 'gtk3')
optdepends=('sni-qt-patched-git: patched qt4 sni plugin to enable icon modification' 'inkscape: to convert svg to png with inkscape' 'imagemagick: used to convert svg to png')
optdepends_x86_64=('lib32-sni-qt-patched-git: 32-bit patched qt4 sni plugin to enable icon modification')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7c9eebb12e05512f8903b56cec53e34dd5221e1b5ce4c181ea73f4fe008342a5')

package() {
  install -Dm755 "$srcdir/$_gitname-$pkgver/hardcode-tray.py" "$pkgdir/opt/$_gitname/hardcode-tray.py"
  install -Dm755 "$srcdir/$_gitname-$pkgver/hardcode-tray" "$pkgdir/usr/bin/hardcode-tray"
  install -d "$pkgdir/opt/$_gitname"
  cp -r -f "$srcdir/$_gitname-$pkgver/src" "$pkgdir/opt/$_gitname"
  cp -r -f "$srcdir/$_gitname-$pkgver/data" "$pkgdir/opt/$_gitname"
}
