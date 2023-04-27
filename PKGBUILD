# Maintainer: Michael Ciociola <michael@ciocio.la>

pkgname=encrypt-timeout-hook-git
pkgver=r1
pkgrel=1
pkgdesc="Custom encrypt hook with shutdown timeout for Arch Linux (git version)"
arch=('any')
url="https://github.com/spoons/encrypt-timeout-hook"
license=('GPL')
depends=('cryptsetup')
makedepends=('git')

source=("git+https://github.com/spoons/encrypt-timeout-hook.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/encrypt-timeout-hook"
    printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
    cd "${srcdir}/encrypt-timeout-hook"
    mkdir -p "${pkgdir}/etc/initcpio/hooks"
    mkdir -p "${pkgdir}/etc/initcpio/install"
    install -m755 hooks/encrypt-timeout "${pkgdir}/etc/initcpio/hooks/encrypt-timeout"
    install -m755 install/encrypt-timeout "${pkgdir}/etc/initcpio/install/encrypt-timeout"
}

