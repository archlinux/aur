# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=amdctl-git
pkgver=0.1
pkgrel=1
pkgdesc="Set P-State voltages and clock speeds on recent AMD CPUs on Linux.
Currently supported families are: 10h, 11h, 12h, 14h, 15h, 16h"
arch=(i686 x86_64)
url="https://github.com/kevinlekiller/amdctl"
license=('GPLv3')
depends=()
source=(https://github.com/kevinlekiller/amdctl/archive/v0.1.zip)
md5sums=(2b95445cbaf4dcc7f7ba066ff1dc897a)

build() 
	{
	cd "${srcdir}"/amdctl-0.1
	make
	}

package() {

	install -Dm755 "${srcdir}"/amdctl-0.1/amdctl "${pkgdir}"/usr/bin/amdctl
	mkdir "${pkgdir}"/etc/
	mkdir "${pkgdir}"/etc/modules-load.d
	touch "${pkgdir}"/etc/modules-load.d/amdctl.conf
	echo "cpuid" > "${pkgdir}"/etc/modules-load.d/amdctl.conf
	echo "msr" >> "${pkgdir}"/etc/modules-load.d/amdctl.conf
}
