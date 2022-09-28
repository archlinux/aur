# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=cachyos-ananicy-rules
_gitname=ananicy-rules
pkgver=1.r30.a2213f1
pkgrel=1
groups=(cachyos)
arch=('any')
license=('GPL')
pkgdesc='CachyOS - ananicy-rules'
source=("${pkgname}::git+https://github.com/CachyOS/${_gitname}.git")
sha256sums=('SKIP')
replaces=(ananicy-rules-git)
provides=(ananicy-rules-git)
conflicts=(ananicy-rules-git)

pkgver() {
  cd "${srcdir}/${pkgname}"
  _gittag="1"
  printf "${_gittag}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -d $pkgdir/etc/ananicy.d
  cp -rf $srcdir/$pkgname/* $pkgdir/etc/ananicy.d
}
