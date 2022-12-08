# Maintainer: Samsagax <samsagax at gmail dot com>
_pkgbase=chimeraos-device-quirks
pkgname=${_pkgbase}-git
pkgver=r2.fa28e78
pkgrel=1
pkgdesc="A collection of device specific configuration files"
arch=('any')
url="https://github.com/ChimeraOS/device-quirks"
license=('MIT')
depends=('systemd')
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/ChimeraOS/device-quirks.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgbase}"
	install -m644 -D -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -m644 -D -t "${pkgdir}/etc/modprobe.d/" etc/modprobe.d/*
	install -m644 -D -t "${pkgdir}/etc/modules-load.d/" etc/modules-load.d/*
	install -m644 -D -t "${pkgdir}/usr/lib/udev/rules.d/" usr/lib/udev/rules.d/*
}
