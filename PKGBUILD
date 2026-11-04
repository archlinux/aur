_name=aur-check-updates
pkgname=${_name}-bin
pkgver=1.1.11
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
sha256sums=('1d5081dd426d29e32aa2b57b584dbe7e65baba08b4e6474da0873f4597075037')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${_name}"
}
