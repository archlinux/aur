# Maintainer: gee
pkgname=cpuid.py-git
pkgver=r27.fcffb0a
pkgrel=2
pkgdesc="Pure Python interface to the CPUID instruction"
url="https://github.com/flababah/cpuid.py"
license=(MIT)
depends=(python)
makedepends=(git)
arch=(any)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/cpuid.py"
	install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
