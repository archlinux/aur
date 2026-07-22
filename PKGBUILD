_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.10
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR (binary release)"
arch=('x86_64')
url="https://github.com/HanabishiRecca/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

depends=(
    'glibc'
    'libalpm.so=16'
    'libcurl.so=4'
    'libgcc'
)

source=("${url}/releases/download/${pkgver}/${_name}-${pkgver}-archlinux-${CARCH}.tar.xz")
sha256sums=('c27fdfbb7ad395bba0ecf7b5e57c05cdf688f9554b2ef5c8b3c62a2f96a09ac8')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
