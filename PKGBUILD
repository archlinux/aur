# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=theos-ios-sdks-git
pkgver=r5.90da563
pkgrel=1
pkgdesc="Patched iOS sdks that include private framework tbds"
arch=('any')
url="https://github.com/theos/sdks"
license=('custom')
depends=('theos')
makedepends=()
optdepends=()
provides=('theos-ios-sdks')
source=("git+https://github.com/theos/sdks")
sha256sums=('SKIP')

pkgver() {
	cd "sdks"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "${pkgdir}/opt/theos/sdks"
	cp -dpr --no-preserve=ownership "${srcdir}/sdks"/*.sdk "${pkgdir}/opt/theos/sdks"
}
