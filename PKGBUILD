# Maintainer: Leonidas Spyropoulos <artafinde @ archlinux.org>
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=cachyos-ananicy-rules
_gitname=ananicy-rules
pkgver=1.1.11
pkgrel=1
epoch=1
groups=(cachyos)
arch=('any')
url='https://github.com/CachyOS/ananicy-rules'
license=(GPL-1.0-only)
pkgdesc='CachyOS - ananicy-rules'
source=(git+https://github.com/CachyOS/ananicy-rules#tag=${pkgver})
sha256sums=('a8c858d07a208cfe0dcdda2c3d70d226020b738e108ab24cc06adfe0b10aa075')
makedepends=(git)
replaces=(ananicy-rules-git)
provides=(ananicy-rules-git)
conflicts=(ananicy-rules-git)

prepare() {
  cd "${_gitname}"
  rm -f README.md
}

package() {
  cd "${_gitname}"
  install -d $pkgdir/etc/ananicy.d
  cp -rf $srcdir/$_gitname/* $pkgdir/etc/ananicy.d
}
