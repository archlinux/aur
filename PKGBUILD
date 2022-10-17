# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=reflector-pacman-hook-git
pkgver=r81.9d5f298
pkgrel=1
pkgdesc='Pacman hook to automatically update Pacman mirrorlist using reflector'
arch=('any')
_gitname='pacman-hooks'
url="https://github.com/desbma/${_gitname}"
license=('GPL')
depends=('reflector')
makedepends=('git')
conflicts=('pacman-hooks-desbma-git')
source=("git+https://github.com/desbma/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm 644 reflector/reflector.hook "${pkgdir}/usr/share/libalpm/hooks/30-reflector.hook" 
}
