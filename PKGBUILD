# 'man PKGBUILD'.
# Maintainer: Jonathan Lee <jono-lee@hotmail.co.uk>

_npmname=budgie-launcher-super
_npmver=1.1.11
pkgname=nodejs-budgie-launcher-super
pkgver=1.1.11
pkgrel=3
pkgdesc="A simple script to switch tasks using \"super + 1\" number keys, the same feature exists with other desktops like windows and unity, this adds it to budgie desktop."
arch=(any)
url="https://github.com/Lee182/budgie-launcher-super"
license=('MIT')
depends=('nodejs>=10.10.0' 'npm' 'dconf' 'wmctrl' 'xdotool')
optdepends=()
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
