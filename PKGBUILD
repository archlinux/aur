# Maintainer: Dario Zarcone <dariozarcone at gmail dot com>

pkgname=('material-gtk-theme-git'
    'material-gtk-theme-deepocean-git'
    'material-gtk-theme-palenight-git'
    'material-icon-theme-git'
    'material-icon-theme-deepocean-git'
    'material-icon-theme-palenight-git')
_reponame='Material-GTK-Themes'
pkgver=r38.4d828d5d
pkgrel=1
pkgdesc='Material gtk themes'
arch=("any")
url="https://github.com/Fausto-Korpsvart/${_reponame}"
license=("GPL3")
makedepends=("git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_reponame}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_material-gtk-theme-git() {
    conflicts=('material-gtk-theme-deepocean-git' 'material-gtk-theme-palenight-git')
    depends=("gnome-themes-extra")
    optdepends=("gtk-engine-murrine")

    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${_reponame}"

    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

    cp -r themes/Material-DeepOcean-B "${dist}/Material-DeepOcean-Border"
    cp -r themes/Material-DeepOcean-BL "${dist}/Material-DeepOcean-Borderless"
    cp -r themes/Material-DeepOcean-B-LB "${dist}/Material-DeepOcean-Border-LegacyButtons"
    cp -r themes/Material-DeepOcean-BL-LB "${dist}/Material-DeepOcean-Borderless-LegacyButtons"
    cp -r themes/Material-Palenight-B "${dist}/Material-Palenight-Border"
    cp -r themes/Material-Palenight-BL "${dist}/Material-Palenight-Borderless"
    cp -r themes/Material-Palenight-B-LB "${dist}/Material-Palenight-Border-LegacyButtons"
    cp -r themes/Material-Palenight-BL-LB "${dist}/Material-Palenight-Borderless-LegacyButtons"

}
package_material-gtk-theme-deepocean-git() {
    conflicts=('material-gtk-theme-git')
    depends=("gnome-themes-extra")
    optdepends=("gtk-engine-murrine")

    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${_reponame}"

    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

    cp -r themes/Material-DeepOcean-B "${dist}/Material-DeepOcean-Border"
    cp -r themes/Material-DeepOcean-BL "${dist}/Material-DeepOcean-Borderless"
    cp -r themes/Material-DeepOcean-B-LB "${dist}/Material-DeepOcean-Border-LegacyButtons"
    cp -r themes/Material-DeepOcean-BL-LB "${dist}/Material-DeepOcean-Borderless-LegacyButtons"
}
package_material-gtk-theme-palenight-git() {
    conflicts=('material-gtk-theme-git')
    depends=("gnome-themes-extra")
    optdepends=("gtk-engine-murrine")

    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${_reponame}"

    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

    cp -r themes/Material-Palenight-B "${dist}/Material-Palenight-Border"
    cp -r themes/Material-Palenight-BL "${dist}/Material-Palenight-Borderless"
    cp -r themes/Material-Palenight-B-LB "${dist}/Material-Palenight-Border-LegacyButtons"
    cp -r themes/Material-Palenight-BL-LB "${dist}/Material-Palenight-Borderless-LegacyButtons"
}
package_material-icon-theme-git() {
    conflicts=('material-icon-theme-deepocean-git' 'material-icon-theme-palenight-git')
    depends=('gtk-update-icon-cache')

    dist="${pkgdir}/usr/share/icons"
    mkdir -p "${dist}"
    cd "${_reponame}"

    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

    cp -r icons/DeepOcean2 "${dist}/Material-DeepOcean"
    cp -r icons/Palenight "${dist}/Material-Palenight"
}
package_material-icon-theme-deepocean-git() {
    conflicts=('material-icon-theme-git')
    depends=('gtk-update-icon-cache')

    dist="${pkgdir}/usr/share/icons"
    mkdir -p "${dist}"
    cd "${_reponame}"

    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

    cp -r icons/DeepOcean2 "${dist}/Material-DeepOcean"
}
package_material-icon-theme-palenight-git() {
    conflicts=('material-icon-theme-git')
    depends=('gtk-update-icon-cache')

    dist="${pkgdir}/usr/share/icons"
    mkdir -p "${dist}"
    cd "${_reponame}"

    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

    cp -r icons/Palenight "${dist}/Material-Palenight"
}
