# Maintainer: Brian Salcedo <salcbrian@gmail.com>
pkgname=rancher-cli-git
pkgver=r174.6fc408b
pkgrel=1
pkgdesc="The Rancher Command Line Interface (CLI) is a unified tool to manage your Rancher server."
arch=('any')
url="https://github.com/rancher/cli"
license=('Apache')
makedepends=('git' 'docker')
provides=("${pkgname%-git}")
source=('git://github.com/rancher/cli.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/cli"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/cli"
	make
}

package() {
	cd "$srcdir/cli"
	install -m755 -D bin/rancher "${pkgdir}/usr/bin/rancher"
}
