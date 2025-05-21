pkgname=element-call
pkgdesc="Group calls powered by Matrix"
url="https://github.com/element-hq/element-call"
license=("Apache-2.0")
arch=("any")
pkgver=0.11.1
pkgrel=1
makedepends=("yarn-berry" "liburing" "git" "nodejs")
depends=()
source=("git+${url}#tag=v${pkgver}")
md5sums=('f0b63f0d2b052b32d6366d3b355822ab')
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
