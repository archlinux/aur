# Maintainer:
# Contributor: Yamada Hayao <development@fascode.net>

_pkgname="getoptions"
pkgname="$_pkgname"
pkgver=3.3.2
pkgrel=1
pkgdesc="An elegant option/argument parser for shell scripts"
url="https://github.com/ko1nksm/getoptions"
license=('CC0-1.0')
arch=('any')

depends=(
  'bash'
)
makedepends=(
  'git'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('2e8c557e878eb2c728cb90af9c0a6e29bf4c50eed0ac196c1f57c76fbfbf9241')

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make install PREFIX="$pkgdir/usr"
}
