pkgver=5.0.2
pkgname=cpu-x-bin
pkgdesc='A Free software that gathers information on CPU, motherboard and more, prebuilt, with ARM64 support'
pkgrel=1.1
arch=(x86_64 aarch64)
provides=(cpu-x)
conflicts=(cpu-x)
url='https://thetumultuousunicornofdarkness.github.io/CPU-X'
license=('GPL3')
depends=('gtkmm3' 'ncurses' 'libcpuid>=0.6.0' 'pciutils' 'glfw' 'vulkan-icd-loader' 'procps-ng>=4.0.0' 'libprocps')
optdepends=('opengl-driver: packaged openGL driver'
            'vulkan-driver: packaged Vulkan driver')
_mirror='http://download.opensuse.org'
_port_url=''

_get_source() {
    _url="${_mirror}"
    if [ "x${1}" == "xaarch64" ]; then
        _url="${_url}/ports/${1}"
    fi
    echo "${_url}/tumbleweed/repo/oss/${1}/cpu-x-${pkgver}-${pkgrel}.${1}.rpm"
}

source_x86_64=(`_get_source x86_64`)
source_aarch64=(`_get_source aarch64`)
sha256sums_x86_64=('9db309203b4177b63a6a41ede0cd7478e4fded3d57380565aa0ee3317ae34acf')
sha256sums_aarch64=('fe2e2a23cd7ab2563c87d1d09f708e31e0bc9ae3b55f21909ad763f7b72a8a26')

package() {
	mv usr "$pkgdir"
}
