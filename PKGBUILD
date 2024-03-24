# Maintainer: yuki_wastaken <yukiat at proton dot me>
pkgname=catnip-git
_pkgname=catnip
pkgver=r161.cb0b8fd
pkgrel=1
pkgdesc="A minimalistic and fast system fetch written in Nim."
arch=(x86_64)
url="https://github.com/iinsertNameHere/catnip"
license=('MIT')
groups=()
depends=('openssl' 'pcre' 'glibc')
makedepends=('git' 'nim')
source=('git+https://github.com/iinsertNameHere/catnip.git')
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname%}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname%}"
	nim install
}

package() {
	cd "${_pkgname%}"
  	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  }
