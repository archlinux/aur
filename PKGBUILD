# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=seccomp-filtered-run
pkgver=1.0.0
pkgrel=1
pkgdesc='Run other program with seccomp filters.'
url="https://gitlab.com/patlefort/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cargo')
arch=('x86_64' 'aarch64')
source=("https://gitlab.com/patlefort/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('431b92b6c3016655f64dc30fe0998853877fccdb27f87fde8d57a2803a81ffb1')

_srcdir="${pkgname}-v${pkgver}"

build() {
	cd "${_srcdir}"

	cargo build --release --target-dir="${srcdir}/build"
}

package() {
	install -Dm755 "build/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
