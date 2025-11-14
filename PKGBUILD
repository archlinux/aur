# Maintainer: Leonidas Spyropoulos <artafinde @ archlinux.org>
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=cachyos-ananicy-rules
_gitname=ananicy-rules
pkgver=1.1.9
pkgrel=1
epoch=1
groups=(cachyos)
arch=('any')
url='https://github.com/CachyOS/ananicy-rules'
license=(GPL-1.0-only)
pkgdesc='CachyOS - ananicy-rules'
source=(git+https://github.com/CachyOS/ananicy-rules#tag=${pkgver})
sha256sums=('7e4517f3798f06f350489bd8a8ee6030d4f916fbcf6e9d35267d05bb617c3514')
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
