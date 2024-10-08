# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=bash.d
pkgver=1564076224
pkgrel=1
pkgdesc="Subscripts for GNU Bash shells"
url="https://github.com/GNU-Pony/bash.d"
arch=(any)
license=(GPL3)
depends=(bash coreutils)
optdepends=("libnotify: for alert.bash"
	    "sed: for palette.bash"
	    "git: for git branch in prompt.bash"
	    "acpi: for battery status in prompt.bash"
	    "featherweight: for featherweight status in prompt.bash")
makedepends=(make findutils grep coreutils)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(4c22ee9708d56d437c768161e18fa464ef259807711c8aafe05e43540d59ba14)

_prefix=/usr


package() {
	cd "${srcdir}/bash.d-${pkgver}"
	make PREFIX=/usr PKGNAME=bash.d DESTDIR="${pkgdir}" install
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

