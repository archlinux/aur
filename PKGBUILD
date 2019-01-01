# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com >

pkgbase=xbmpwall-git
pkgname=$pkgbase
pkgver=1.1
pkgrel=1

_gitname=xbmpwall
_gittag="v${pkgver}"

pkgdesc="X11 bitmaps file manager (.xbm) for xsetroot"

arch=('x86_64')

url='https://github.com/daltomi/xbmpwall'

license=('GPL3')

depends=('libxaw' 'xorg-xsetroot')

makedepends=('git' 'gcc' 'make' )

source=("git+${url}.git?signed#tag=${_gittag}")

sha256sums=('SKIP')

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')


build() {
  cd $_gitname &&  make release
}

package() {
  install -Dm755 "$_gitname/xbmpwall" "$pkgdir/usr/bin/xbmpwall"
  install -m755 -d "$pkgdir/usr/share/xbmpwall"
}
