# Maintainer: Muhammad Zaky Ramadhan <mzakyr42@gmail.com>

pkgname=osfetch-sh-git
pkgver=r17.ec5682d
pkgrel=1
pkgdesc="osfetch-sh is a stupid system fetch program written in bash for linux. (git version)"
arch=('any')
url="https://github.com/mzakyr42/osfetch-sh"
license=('MIT')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/mzakyr42/osfetch-sh')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/LICENSE"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
