# Maintainer tam1m <tbacc+aur@pm.me>
# Contributor Strykar <strykar@live.com>

pkgname=nvidia-keylase-patch-git
pkgver=7c26bc5
pkgrel=1
pkgdesc='NVENC and NvFBC patches for Nvidia drivers by keylase'
arch=('x86_64')
_gitname='nvidia-patch'
url="https://github.com/keylase/${_gitname}"
license=('Unknown')
depends=('NVIDIA-MODULE')
makedepends=('git')
source=("git+https://github.com/keylase/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"

    install -Dm 644 -t "${pkgdir}/usr/share/nvidia-keylase" drivers.json
    install -Dm 644 -t "${pkgdir}/usr/share/nvidia-keylase" patch-fbc.sh
    install -Dm 644 -t "${pkgdir}/usr/share/nvidia-keylase" patch.sh
}
