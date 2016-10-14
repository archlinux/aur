# Maintainer: Roland Singer <roland.singer@desertbit.com>
# Upstream URL: https://github.com/m4ng0squ4sh/razer_blade_14_2016_acpi_fix

pkgname=razer_blade_14_2016_acpi_fix-git
_pkgname=razer_blade_14_2016_acpi_fix
pkgver=8.b309883
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/m4ng0squ4sh/razer_blade_14_2016_acpi_fix'
license=('GPLv2')
pkgdesc='ACPI firmware fix for the Razer Blade 14 2016'
makedepends=('git' 'cpio' 'iasl')
source=("git+https://github.com/m4ng0squ4sh/razer_blade_14_2016_acpi_fix.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    make all
    make DESTDIR="${pkgdir}" install
}
