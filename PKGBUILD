# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail dot com
_pkgname=python-keepmenu
_gitname=keepmenu
pkgname=$_pkgname-git
pkgver=r8.7418838
pkgrel=1
pkgdesc="Dmenu/Rofi frontend for Keepass databases."

arch=('any')
url="https://github.com/firecat53/keepmenu"
license=('GPLv3')
depends=('python' 'python-pykeepass' 'python-pyuserinput-git')
makedepends=('git')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required'
            'xdotool: required for typing non-U.S. Unicode characters')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/firecat53/$_gitname.git")
md5sums=('SKIP')
install="$_pkgname.install"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/$_gitname/keepmenu" "$pkgdir/usr/bin/keepmenu"
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_gitname/README.rst" "$pkgdir/usr/share/doc/$pkgname/README.rst"
  install -Dm644 "$srcdir/$_gitname/config.ini.example" "$pkgdir/usr/share/doc/$pkgname/config.ini.example"
}

# vim:set ts=2 sw=2 et:
