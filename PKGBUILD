# Maintainer: Jerry Chanut <j.chanut@gmail.com>
pkgname=fast-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Minimal zero-dependency utility for testing your internet download speed from terminal. Written in Go. Uses fast.com"
arch=('x86_64')
url="https://github.com/ddo/fast"
license=('MIT')
provides=('fast')
source=("${pkgname}::https://github.com/ddo/fast/releases/download/v${pkgver}/fast_linux_amd64")
md5sums=('SKIP')

package() {
	install -d "${pkgdir}/opt/fast"
	install -m755 "${srcdir}/${pkgname}" "${pkgdir}/opt/fast/fast"
	install -d "${pkgdir}"/usr/bin

	ln -s /opt/fast/fast ${pkgdir}/usr/bin/fast
}
