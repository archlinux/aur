# Maintainer: Orestis Floros <orestisflo@gmail.com>
_name='zsh-background-notify'
pkgname="${_name}-git"
pkgver=r31.d5f0430
pkgrel=1
pkgdesc="Cross-platform background notifications for long running commands!"
url="https://github.com/t413/zsh-background-notify"
arch=('any')
depends=('zsh')
makedepends=('git')
provides=($_name)
source=("${_name}::${url//https/git+https}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_name}"
    install -d "${pkgdir}/usr/share/zsh/plugins/${_name}"
    cp -a --no-preserve=ownership *.zsh "${pkgdir}/usr/share/zsh/plugins/${_name}"
}
