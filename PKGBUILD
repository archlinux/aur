
# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

_pkgbase=hardcode-tray
_gitname=Hardcode-Tray
pkgname=$_pkgbase
pkgver=3.5.2
pkgrel=1
pkgdesc="Fixes Hardcoded Tray Icons"
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/Hardcode-Tray"
license=('GPL')
provides=("$_pkgbase")
conflicts=("hardcode-tray-fixer-git" "hardcode-tray-git")
depends=('python' 'python-gobject' 'python-cairosvg' 'librsvg' 'gtk3')
optdepends=('sni-qt-eplus-bzr: patched qt4 sni plugin to enable icon modification' 'inkscape: to convert svg to png with inkscape')
optdepends_x86_64=('lib32-sni-qt-eplus-bzr: 32-bit patched qt4 sni plugin to enable icon modification')
source=("https://github.com/bil-elmoussaoui/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('bf1a6f03f4758dbf25807206c4cc5b153cdaefebb10e377f5661cd1ac28b0fb1')

package() {
  install -Dm755 "$srcdir/$_gitname-$pkgver/script.py" "$pkgdir/opt/$_gitname/script.py"
  install -Dm755 "$srcdir/$_gitname-$pkgver/hardcode-tray" "$pkgdir/usr/bin/hardcode-tray"
  install -d "$pkgdir/opt/$_gitname"
  cp -r "$srcdir/$_gitname-$pkgver/database" "$pkgdir/opt/$_gitname"
}
