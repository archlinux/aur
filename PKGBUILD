# Maintainer: Roland Singer <roland.singer@desertbit.com>
# Upstream URL: https://github.com/m4ng0squ4sh/razer_blade_14_2016_acpi_dsdt

pkgname=razer_blade_14_2016_acpi_dsdt-git
_pkgname=razer_blade_14_2016_acpi_dsdt
pkgver=3.3c708e8
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/m4ng0squ4sh/razer_blade_14_2016_acpi_dsdt'
license=('GPLv2')
pkgdesc='DSDT Fix for the Razer Blade 14 2016'
makedepends=('git cpio iasl')
source=("git+https://github.com/m4ng0squ4sh/razer_blade_14_2016_acpi_dsdt.git")
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
