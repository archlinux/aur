# Maintainer: revsuine <paradoor at protonmail dot com>
pkgname=ttf-gohufont-nerd
pkgver=v3.2.1
pkgrel=1
pkgdesc="A bitmap font for programming and terminal use, patched to include Nerd Font symbols."
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Gohu"
license=('MIT')
depends=()
makedepends=()
optdepends=()
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/$pkgver/Gohu.tar.xz")
sha256sums=('SKIP') # nerd fonts do not provide sums

package() {
    _installation_dir="${pkgdir}/usr/share/fonts/TTF/GohuFontNerd"
    install -dm 755 "${_installation_dir}"

    # copy everything matching this pattern
    cd "${srcdir}"
    for ttf in $(ls | grep "GohuFont[^\s\.]*\.ttf")
    do
        install -m 644 "${ttf}" "${_installation_dir}/${ttf}"
    done
}
