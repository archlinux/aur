# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/caligari87/ObAddon
# Upstream: https://github.com/caligari87/ObAddon

pkgname=('obaddon-git')
pkgver=2020.04.04.10.g25917894
pkgrel=1
pkgdesc="Community-built prefabs and other enhancements for Oblige 7.70"
arch=('any')
url='https://github.com/caligari87/ObAddon'
license=('GPLv3')
depends=('oblige')
makedepends=('zip' 'make')
optdepends=('gzdoom' 'qzdl')
provides=('obaddon')
# conflicts=()
source=("$pkgname::git+https://github.com/caligari87/ObAddon.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname/scripts"
  make
  install -Dm 744 "build/obaddon.pk3" "$pkgdir/usr/share/oblige/addons/obaddon.pk3";
}
