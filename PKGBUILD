# Maintainer: Shi Liang <shiliang2008@msn.com>

pkgname=graphite-gtk-theme-git
_reponame='Graphite-gtk-theme'
pkgver=2021.11.26.r5.gea5abc7
pkgrel=1
pkgdesc='Graphite gtk theme'
arch=("any")
provides=("graphite-gtk-theme")
conflicts=("graphite-gtk-theme")
url="https://github.com/vinceliuice/${_reponame}"
license=("GPL2")
depends=("gnome-themes-extra")
optdepends=("gtk-engine-murrine")
makedepends=("git" "sassc")
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!strip)

pkgver(){
    cd "${srcdir}/${_reponame}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}"
    ./install.sh -t all -d "${dist}" -s compact
}
