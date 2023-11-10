# Maintainer: qwjyh <urataw421 at gmail dot com>
# Contributor: danb <danielbusch1992@googlemail.com>

pkgname=makefontpkg-git
_pkgname="${pkgname%-git}"
pkgver=r28.3fed100
pkgrel=1
pkgdesc="Tool for creating packages from TrueType and OpenType fonts"
arch=(x86_64 i686)
url='http://github.com/misterdanb/makefontpkg'
license=(GPL3)
depends=(python3 pacman-contrib)
makedepends=(git)
replaces=('makefontpkg')
# options=('!strip' '!emptydirs')
source=("${_pkgname}::git+https://github.com/misterdanb/makefontpkg.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit 1
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${_pkgname}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
