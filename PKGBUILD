# Maintainer: Strykar <2946372+Strykar@users.noreply.github.com>

pkgname=nvidia-keylase-patch
pkgver=r13.1443fec
pkgrel=1
pkgdesc='NVENC and NvFBC patches for Nvidia drivers'
arch=('x86_64')
_gitname='nvidia-patch'
url="https://github.com/keylase/${_gitname}"
license=('GPL')
depends=('nvidia' 'nvidia-dkms')
makedepends=('git')
source=("git+https://github.com/keylase/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"

    install -Dm 644 -t "${pkgdir}/usr/share/nvidia-keylase" nvidia-patch/drivers.json
    install -Dm 644 -t "${pkgdir}/usr/bin" nvidia-patch/patch-fbc.sh
    install -Dm 644 -t "${pkgdir}/usr/bin" nvidia-patch/patch.sh
}
