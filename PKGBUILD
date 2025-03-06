# Maintainer: Leonidas Spyropoulos <artafinde @ archlinux.org>
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=cachyos-ananicy-rules
_gitname=ananicy-rules
pkgver=1.0.7
pkgrel=1
epoch=1
groups=(cachyos)
arch=('any')
url='https://github.com/CachyOS/ananicy-rules'
license=(GPL-1.0-only)
pkgdesc='CachyOS - ananicy-rules'
source=(git+https://github.com/CachyOS/ananicy-rules#tag=${pkgver})
sha256sums=('f2eddbdfddd8b385d817a48e4cd24c2532ff526ad5e1d7e7b08c026dfba431d7')
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
