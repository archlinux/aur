# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=zcfan-git
_gitname=zcfan
pkgver=1.2.1.r0.g5cf1439
pkgrel=1
pkgdesc='Zero-configuration fan control for ThinkPad (git version)'
url="https://github.com/cdown/zcfan"
license=('MIT')
arch=('any')
depends=()
provides=(zcfan)
conflicts=(zcfan)
makedepends=(git)
source=('git+https://github.com/cdown/zcfan.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd -- "$_gitname"
    make prefix="/usr"
}

package() {
    cd -- "$_gitname"
    make prefix="/usr" DESTDIR="$pkgdir/" install
}
