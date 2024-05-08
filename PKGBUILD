# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=arwtojpg-git
_gitname=arwtojpg
pkgver=0.1.0.r0.g3036a34
pkgrel=1
pkgdesc='Fast extraction of embedded JPEGs from Sony ARW files'
url='http://github.com/cdown/arwtojpg'
arch=(any)
license=('MIT')
depends=()
provides=(arwtojpg)
conflicts=(arwtojpb)
makedepends=(git)

source=('git+https://github.com/cdown/arwtojpg.git#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir?}/$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir?}/$_gitname"
    make install DESTDIR="${pkgdir?}" PREFIX="/usr"
}
