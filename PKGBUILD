# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=vim-committia
pkgver=2020.08.27
_commit="1d288281586d1e6b52646a4c412df3dd3a2fe231"
pkgrel=1
pkgdesc="A Vim plugin for more pleasant editing on commit messages"
arch=("any")
depends=("vim" "git")
groups=("vim-plugins")
license=("MIT")
source=("https://github.com/rhysd/committia.vim/archive/${_commit}.tar.gz")
sha512sums=("5eb0bd316bac13b18bd651a3d4caf39cee23d4d8f1b35c1847cf80592e7e4f63b44d51e4faf67f0323c38f7e5543c4dcaf52b6a9830dcbbb357fe89de1b30590")

package() {
    cd "committia.vim-${_commit}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/vim-committia/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vim-committia/README.md"

    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    cp -r -t "${pkgdir}/usr/share/vim/vimfiles" autoload plugin
}
