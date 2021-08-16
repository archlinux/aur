# Maintainer: Daniel T. Borelli <daltomi@disroot.org>

pkgbase=chkuuid-git
pkgname=$pkgbase
pkgver=1.7
pkgrel=1
_gitname=chkuuid
_gittag="v${pkgver}"

pkgdesc="Compare the UUID of each partition with those found in FSTAB."

arch=('x86_64')

conflicts=('chkuuid')

url="https://github.com/daltomi/$_gitname"

license=('GPL3')

makedepends=('git' 'gcc' 'make' 'pkg-config' 'util-linux-libs')

depends=('util-linux-libs') 

source=("git+${url}.git?signed#tag=${_gittag}")

sha256sums=('SKIP')

validpgpkeys=('BADA62B7B55622A8B764DC6CB1B08540E74FE8A2')

build() {
  cd $_gitname &&  make
}

package() {
        install -Dm755 "$srcdir/chkuuid/chkuuid" "$pkgdir/usr/bin/chkuuid"
}

#  vim: set ts=8 sw=8 tw=500 et :
