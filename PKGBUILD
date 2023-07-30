# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

_reponame=VFIO-Tools
_binname=qemu
_pkgname=libvirt-hook-helper
pkgname=libvirt-hook-helper-git
pkgver=r50.2bb6d4c
pkgrel=3
pkgdesc="Helper tool to run scripts on libvirt VM startup or shutdown"
arch=('any')
license=('MIT')
provides=('libvirt-hook-helper')
conflicts=('libvirt-hook-helper')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/PassthroughPOST/VFIO-Tools")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/libvirt_hooks/${_binname}" "${pkgdir}/etc/libvirt/hooks/${_binname}"
}
