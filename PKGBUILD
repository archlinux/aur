# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>

pkgname=nodenv-node-build-git
pkgver=2.3.1.r7.gf47f7ad
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=("any")
url="https://github.com/nodenv/node-build"
license=("MIT")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "node-build")
source=("git://github.com/nodenv/node-build")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/node-build"

	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/node-build"

	PREFIX="${pkgdir}/usr" ./install.sh
}
