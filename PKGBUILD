# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bash.d
pkgver=1487613679
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
sha256sums=(646486a78a0e6cb1af65810d797fe992573cf9dfc8554152e88e9d0b6730e3f4)

_prefix=/usr


package() {
	cd "${srcdir}/bash.d-${pkgver}"
	make PREFIX=/usr PKGNAME=bash.d DESTDIR="${pkgdir}" install
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

