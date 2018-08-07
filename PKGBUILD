# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=arm-eabi-4.7
pkgver=r5
pkgrel=1
pkgdesc="Google's arm-eabi-4.7 toolchain for Android"
arch=("x86_64")
url="https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7"
license=('unknown')
groups=()
depends=()
makedepends=()
options=(!strip libtool staticlibs)
source=("git+https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/arm-eabi-4.7"
	printf "r%d" "$(git rev-list --count HEAD)"
}

package() {
	install -d -m0755 "${pkgdir}/opt/toolchains"
	cp -a "${srcdir}/arm-eabi-4.7" "${pkgdir}/opt/toolchains/"
	rm -r "${pkgdir}/opt/toolchains/arm-eabi-4.7/.git"
}
