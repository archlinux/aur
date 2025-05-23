# Maintainer: Alexsandro Thomas <alexsandrogthomas@gmail.com>
pkgname=ninjatracing-git
pkgver=r54.a669e36
pkgrel=1
pkgdesc="Convert .ninja_log files to chrome's about:tracing format"
arch=('any')
url="https://github.com/nico/ninjatracing"
license=('Apache-2.0')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 "$srcdir/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
