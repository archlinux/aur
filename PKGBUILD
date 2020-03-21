# Maintainer: André Almeida <andrealmeid@riseup.net>

pkgname=amdgpuinfo-git
_pkgname=amdgpuinfo
pkgrel=1
pkgver=r118.73511dc
pkgdesc="Get information from AMD Radeon GPUs"
arch=('any')
url="https://github.com/andrealmeid/amdgpuinfo"
license=('GPL3')
depends=('ocl-icd' 'opencl-headers')
makedepends=('git' 'gcc')
source=('git://github.com/andrealmeid/amdgpuinfo.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
}
