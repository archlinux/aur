# Maintainer: thecashewtrader <thecashewtrader at protonmail dot com>
pkgname=scafetch-git
pkgrel=2
pkgver=0.1.1
pkgdesc="A command-line tool to display information about your remote Git repositories in an aesthetic and visually pleasing way."
arch=('any')
url="https://github.com/iddev5/scafetch"
license=('MIT')
makedepends=('zig-master-bin' 'git' 'gyro-bin')
source=(git+https://github.com/iddev5/scafetch)
sha256sums=('SKIP')

check() {
    cd "${srcdir}/scafetch"
    gyro build test
}

package() {
    cd "${srcdir}/scafetch"
	gyro build install -Drelease-fast --prefix "${pkgdir}/usr"
}