# Maintainer: yuki_wastaken <yukiat@proton.me>
pkgname=catnip-git
_pkgname=catnip
pkgver=r50.fe90ca5
pkgrel=1
pkgdesc="A minimalistic and fast system fetch written in Nim."
arch=(x86_64)
url="https://github.com/iinsertNameHere/catnip"
license=('MIT')
groups=()
depends=('openssl' 'pcre')
makedepends=('git' 'nim')
source=('git+https://github.com/iinsertNameHere/catnip.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname%}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${_pkgname%}"
	nim setup
}

package() {
	cd "${_pkgname%}"
  	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	cd bin
	install -Dm755 catnip "$pkgdir/usr/bin/catnip"
}
