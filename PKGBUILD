# Maintainer: Shi Liang <shiliang2008@msn.com>

pkgname=graphite-gtk-theme-git
_reponame='Graphite-gtk-theme'
pkgver=202109173g62a3fa0
pkgrel=1
pkgdesc='Graphite gtk theme'
arch=("any")
provides=("graphite-gtk-theme")
conflicts=("graphite-gtk-theme")
url="https://github.com/vinceliuice/${_reponame}"
license=("GPL2")
depends=("gnome-themes-extra")
optdepends=("gtk-engine-murrine")
makedepends=("git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/${_reponame}"
    git describe --tags | sed 's/-//g'
}

package() {
    dst="${pkgdir}/usr/share/themes"
    mkdir -p "${dst}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dst}"
}
