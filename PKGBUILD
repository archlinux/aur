# Maintainer: George Hilliard <me@thirtythreeforty.net>
# Contributor: ava1ar <mail@ava1ar.me>
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=intel-opencl-runtime
pkgver=2024.2.1
_debpkgrel=1079
pkgrel=1
pkgdesc="Intel oneAPI OpenCL runtime library for Intel Core and Xeon processors"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
  "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-runtime-opencl-2024-${pkgver}-${_debpkgrel}_amd64.deb"
  "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-runtime-dpcpp-sycl-opencl-cpu-2024-${pkgver}-${_debpkgrel}_amd64.deb"
)
b2sums=('cda1ecba113a5c2ce71c1475090c9a3926690cf7438a616af09ead723885e254cd8ffe898c4e9ec28195bd0999185b2cceef82f3e238029e35ec2d99ac22df6b'
        'eaf8778efb76405541b5970f4023d45aecab0b729075abdbce5f518d5fd7721e0eaa5a322ed7a8867f4a2cf0c211b42c2f99ab23a250b725cc47df0eba893014')
depends=('intel-oneapi-compiler-shared-runtime')
noextract=(
    "intel-oneapi-runtime-opencl-2024-${pkgver}-${_debpkgrel}_amd64.deb"
    "intel-oneapi-runtime-dpcpp-sycl-opencl-cpu-2024-${pkgver}-${_debpkgrel}_amd64.deb"
)
conflicts=('intel-oneapi-basekit')

package() {
    cd "${srcdir}"

    ar x "${srcdir}/intel-oneapi-runtime-opencl-2024-${pkgver}-${_debpkgrel}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/intel-oneapi-runtime-dpcpp-sycl-opencl-cpu-2024-${pkgver}-${_debpkgrel}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz
}
