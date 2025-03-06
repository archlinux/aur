pkgname=element-call
pkgdesc="Group calls powered by Matrix"
url="https://github.com/element-hq/element-call"
license=("Apache-2.0")
arch=("any")
pkgver=0.7.2
pkgrel=1
makedepends=("yarn" "liburing" "git")
depends=()
source=("git+${url}#tag=v${pkgver}")
md5sums=('bdc0d1008777807511b4f99adcee22c5')
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
