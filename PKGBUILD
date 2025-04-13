# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>

pkgname=unimatrix-git
pkgver=r89.5cf67aa
pkgrel=1
pkgdesc='Python script to simulate the display from "The Matrix" in terminal. Uses half-width katakana unicode characters by default, but can use custom character sets.'
arch=('any')
url="https://github.com/will8211/unimatrix"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=('unimatrix')
conflicts=('unimatrix')
source=("$pkgname"::git+${url}.git)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    # TODO: Right now there are no tags in the git repo.
    # Change the command below to use tags when the first official version gets released.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"

    mkdir --parents "${pkgdir}/usr/bin/"
    install --mode 755 unimatrix.py "${pkgdir}/usr/bin/unimatrix.py"
    ln --symbolic /usr/bin/unimatrix.py "${pkgdir}/usr/bin/unimatrix"
}
