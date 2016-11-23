
# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

_pkgbase=hardcode-tray
_gitname=Hardcode-Tray
pkgname=$_pkgbase
pkgver=3.5.2.1
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
sha256sums=('4140714c2c4eee9681d4939c7fdec7ffbc6d71962a96d672e00266bfd8bfbba9')

package() {
  install -Dm755 "$srcdir/$_gitname-$pkgver/script.py" "$pkgdir/opt/$_gitname/script.py"
  install -Dm755 "$srcdir/$_gitname-$pkgver/hardcode-tray" "$pkgdir/usr/bin/hardcode-tray"
  install -d "$pkgdir/opt/$_gitname"
  cp -r "$srcdir/$_gitname-$pkgver/database" "$pkgdir/opt/$_gitname"
}
