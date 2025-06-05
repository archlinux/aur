# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-suda
pkgver=1.2.4
pkgrel=2
pkgdesc="An alternative sudo.vim for Vim and Neovim"
arch=('any')
url="https://github.com/lambdalisue/vim-suda"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'sudo')
makedepends=('git')
source=("${pkgname}::git+https://github.com/lambdalisue/vim-suda.git#tag=v${pkgver}")
sha256sums=('3595910cfdc8bd8ffaa3e6e0e272969c5a1cae826b614e17c9eb7c3a464b951e')

package() {
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"

    cd "${pkgname}"

    cp -r --preserve=mode autoload doc plugin "${pkgdir}/usr/share/vim/vimfiles"/

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
