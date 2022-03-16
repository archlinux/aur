# Maintainer: thecashewtrader <thecashewtrader@protonmail.com>
pkgname=scafetch
pkgrel=1
pkgver=0.1
pkgdesc="Scafetch is a command-line tool to display information about your remote Git repositories in an aesthetic and visually pleasing way."
arch=('any')
url="https://github.com/iddev5/scafetch/${pkgname}"
license=('MIT')
makedepends=('zig-master-bin' 'git' 'gyro-bin')
source=(git+https://github.com/iddev5/${pkgname})
sha256sums=('SKIP')

check() {
    cd "${srcdir}/${pkgname}"
    gyro build test
}

package() {
    cd "${srcdir}/${pkgname}"
	gyro build install -Drelease-fast --prefix "${pkgdir}/usr"
}
