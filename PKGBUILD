pkgname=element-call
pkgdesc="Group calls powered by Matrix"
url="https://github.com/element-hq/element-call"
license=("Apache-2.0")
arch=("any")
pkgver=0.5.17
pkgrel=1
makedepends=("yarn" "liburing")
depends=()
source=("git+${url}#tag=v${pkgver}")
md5sums=("SKIP")
provides=("element-call")
options=()
backup=()

function prepare() {
	cd element-call
	yarn
}

function build() {
	cd element-call
	yarn build
}

function package() {
	cd element-call
	install -d "${pkgdir}/usr/share/webapps/element-call"
	cp -r dist/* "${pkgdir}/usr/share/webapps/element-call"
}
