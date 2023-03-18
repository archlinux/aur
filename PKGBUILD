# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Gorski <piotrgorski@cachyos.org>

pkgname=ananicy-rules
pkgver=1.r55.478717a
pkgrel=1
groups=(cachyos)
arch=('any')
license=('GPL')
pkgdesc='CachyOS - ananicy-rules'
url='https://github.com/CachyOS/ananicy-rules'
source=("${pkgname}::git+https://github.com/CachyOS/${pkgname}.git")
sha256sums=('SKIP')
makedepends=('git')
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
