
# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

_pkgbase=hardcode-tray
_gitname=Hardcode-Tray
pkgname=$_pkgbase
pkgver=3.8.1
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
sha256sums=('8394a36564f1789e45f92da42ef16445318d8c46af0267548a8f74fb7b1c2d95')

package() {
  install -Dm755 "$srcdir/$_gitname-$pkgver/hardcode-tray.py" "$pkgdir/opt/$_gitname/hardcode-tray.py"
  install -Dm755 "$srcdir/$_gitname-$pkgver/hardcode-tray" "$pkgdir/usr/bin/hardcode-tray"
  install -d "$pkgdir/opt/$_gitname"
  cp -r -f "$srcdir/$_gitname-$pkgver/src" "$pkgdir/opt/$_gitname"
  cp -r -f "$srcdir/$_gitname-$pkgver/data" "$pkgdir/opt/$_gitname"
}
