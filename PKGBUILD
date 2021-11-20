# Maintainer: zpyg <pu.mb@outlook.com>
pkgname=zinit-git
provides=("zinit")
pkgver=v3.7.r209.g8f4e3bbf
pkgrel=1
pkgdesc='A flexible and fast Zsh plugin manager.'
arch=('x86_64')
url='https://github.com/zdharma-continuum/zinit'
license=('MIT')
depends=('git' 'curl' 'zsh')
makedepend=('git')
source=('zinit::git+https://github.com/zdharma-continuum/zinit.git')
sha256sums=('SKIP')
install=zinit-git.install
pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname%-git}" "${pkgdir}/usr/share/${pkgname%-git}"
    make --directory="${pkgdir}/usr/share/${pkgname%-git}"
}

