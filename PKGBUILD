# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: onefire <onefire.myself@gmail.com>

pkgname=viennacl
_pkgname=ViennaCL
pkgver=1.7.1
_pkgver=1.7.x
pkgrel=2
pkgdesc="The library provides high level C++ interfaces for linear algebra routines on CPUs and GPUs using CUDA, OpenCL and OpenMP."
arch=('any')
url="http://viennacl.sourceforge.net/"
depends=("opencl-icd-loader" "opencl-headers")
optdepends=("cuda" "opencl-nvidia") 
license=('custom')
source=("http://downloads.sourceforge.net/project/${pkgname}/${_pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('5e5a9c6defba48bcb6c49a04822bec3b5b0fd0805f0f28c7bdc4b81a04ef58e9c9bf89083015935703474eee75c8be80dd7c4a4d9ee51591f9dfaec9fe3d1ee2')

package() {
	cd "${_pkgname}-${pkgver}"

	mkdir -p \
		"${pkgdir}/usr/include" \
		"${pkgdir}/usr/share/licenses/${pkgname}"

	cp -r "${pkgname}" "${pkgdir}/usr/include"
	chmod -R u=rwX,go=rX "${pkgdir}/usr/include"
	install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}


