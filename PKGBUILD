# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com>

pkgbase=xlesspass
pkgname=$pkgbase-git
pkgver=2.2
pkgrel=1
_gitname=XLessPass
_gittag="v${pkgver}"
pkgdesc="Front-End for lesspass-cli"
arch=('x86_64')
url='https://github.com/daltomi/XLessPass'
license=('GPL3')
depends=('gtk2')
install=xlesspass-git.install
makedepends=('git' 'lazarus-gtk2')
source=('xlesspass-git.install' "git+${url}.git#tag=$_gittag")
sha1sums=('54336d3c364cf41bcf357968983a3fb8c0c0ef8c'
          'SKIP')


build() {
  cd $_gitname
  lazbuild --bm=Release xlesspass.lpi
}

package() {
  cd $_gitname
  install -Dm755 $pkgbase "$pkgdir/usr/bin/$pkgbase"
  install -Dm644 $pkgbase.desktop "$pkgdir/usr/share/applications/$pkgbase.desktop"
  install -Dm644 icons/key.png "$pkgdir/usr/share/pixmaps/$pkgbase.png"
}
