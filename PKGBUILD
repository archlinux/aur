##
# Maintainer: pyamsoft <pyam.soft@gmail.com>
##

pkgname=pstate-frequency
pkgdesc="Easily control Intel p-state driver"
pkgver=1.2.6
pkgrel=1
arch=('i686' 'x86_64')
depends=('coreutils')
makedepends=()
optdepends=('x86_energy_perf_policy')
provides=('pstate-frequency')
conflicts=('pstate-frequency')
license=('GPLv2')
url="https://github.com/pyamsoft/pstate-frequency/archive/${pkgver}.tar.gz"
source=("${url}")
sha256sums=('28d66829f782f0fddc7776a8dac9cd321fb574c9cc3b7fb47deee5f0fda0a69e')

###############################################################################

##
# Please read config.mk for an explanation
# of the variable options in this file
##

##
# DEFAULTS
# _CXX="g++"
# _PREFIX="/usr/local"
# _INCLUDE_BASH_COMPLETION=1
# _INCLUDE_ZSH_COMPLETION=1
# _INCLUDE_UDEV_RULE=1
# _INCLUDE_SYSTEMD_UNIT=1
##

_CXX="g++"
_PREFIX="/usr"
_INCLUDE_BASH_COMPLETION=1
_INCLUDE_ZSH_COMPLETION=0
_INCLUDE_UDEV_RULE=0
_INCLUDE_SYSTEMD_UNIT=1
_INCLUDE_DOC=1
_INCLUDE_SRC=1

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make \
		DESTDIR="$pkgdir" \
		CXX="${_CXX}" \
		PREFIX="${_PREFIX}" \
		INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
		INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
		INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
		INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
		INCLUDE_DOC=${_INCLUDE_DOC} \
		INCLUDE_SRC=${_INCLUDE_SRC} \
		options
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make \
		DESTDIR="$pkgdir" \
		CXX="${_CXX}" \
		PREFIX="${_PREFIX}" \
		INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
		INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
		INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
		INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
		INCLUDE_DOC=${_INCLUDE_DOC} \
		INCLUDE_SRC=${_INCLUDE_SRC}
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make \
		DESTDIR="$pkgdir" \
		CXX="${_CXX}" \
		PREFIX="${_PREFIX}" \
		INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
		INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
		INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
		INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
		INCLUDE_DOC=${_INCLUDE_DOC} \
		INCLUDE_SRC=${_INCLUDE_SRC} \
		install
}

