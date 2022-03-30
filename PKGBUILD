# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=zcfan-git
_gitname=zcfan
pkgver=0.3.r23.g7d356b1
pkgrel=1
pkgdesc='Zero-configuration fan control for ThinkPad (git version)'
url="https://github.com/cdown/zcfan"
license=('MIT')
arch=('any')
depends=()
provides=(zcfan)
conflicts=(zcfan)
makedepends=(git)
source=(git+https://github.com/cdown/zcfan.git)
md5sums=('SKIP')

build() {
    cd -- "$_gitname"
    make zcfan
}

package() {
    mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/lib/systemd/system
    cp -a "${srcdir?}/$_gitname"/zcfan "$pkgdir"/usr/bin
    cp -a "${srcdir?}/$_gitname"/zcfan.service \
	"$pkgdir"/usr/lib/systemd/system
}
