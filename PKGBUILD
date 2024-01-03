# Maintainer: Alessandro Fulgini <fuljo97 at gmail dot com>

pkgname='tokyonight-gtk-theme-git'
_reponame='Tokyo-Night-GTK-Theme'
pkgver=r57.e9790345
pkgrel=1
pkgdesc='A GTK theme based on the Tokyo Night colour palette.'
arch=("any")
url="https://github.com/Fausto-Korpsvart/${_reponame}"
license=("GPL3")
depends=("gnome-themes-extra")
optdepends=("gtk-engine-murrine")
makedepends=("git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_reponame}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${_reponame}"

    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    install -D -m0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    cp -r themes/Tokyonight-Dark-B "${dist}/Tokyonight-Dark-B"
    cp -r themes/Tokyonight-Dark-BL "${dist}/Tokyonight-Dark-BL"
    cp -r themes/Tokyonight-Dark-B-LB "${dist}/Tokyonight-Dark-B-LB"
    cp -r themes/Tokyonight-Dark-BL-LB "${dist}/Tokyonight-Dark-BL-LB"
    cp -r themes/Tokyonight-Storm-B "${dist}/Tokyonight-Storm-B"
    cp -r themes/Tokyonight-Storm-BL "${dist}/Tokyonight-Storm-BL"
    cp -r themes/Tokyonight-Storm-B-LB "${dist}/Tokyonight-Storm-B-LB"
    cp -r themes/Tokyonight-Storm-BL-LB "${dist}/Tokyonight-Storm-BL-LB"
}
