# Maintainer: Strykar <2946372+Strykar@users.noreply.github.com>

pkgname=pacman-hooks-strykar
pkgver=0.12xfr
pkgrel=1
pkgdesc='Various personal Pacman hooks'
arch=('x86_64')
_gitname='pacman-hooks'
url="https://github.com/strykar/${_gitname}"
license=('GPL')
depends=('pacman-contrib' 'nvidia-keylase-patch' 'pug' 'pacman-cleanup-hook' 'informant' 'overdue' 'kernel-modules-hook')
makedepends=('git')
source=("git+https://github.com/strykar/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"

    install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" nvidia/nvidia-keylase.hook
    install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" orphans/orphans.hook
    install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" arch-audit/arch-audit.hook
}
