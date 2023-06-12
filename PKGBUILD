# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='blender-plugin-supertuxkart-git'
pkgver=r120.88ff5df
_blenderver='3.5'
pkgrel=1
pkgdesc="Custom scripts made to help in the creation of custom SuperTuxKart karts and tracks."
arch=('any')
url="https://github.com/supertuxkart/stk-blender"
license=('MIT')
depends=('blender'
         'supertuxkart')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}"
          'stk-blender')
conflicts=()
source=("${pkgname}::git+https://github.com/supertuxkart/stk-blender.git")
sha256sums=('SKIP')


pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"

    _dest="${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons"
    install -d "${_dest}"
    cp -r -t "${_dest}" 'io_antarctica_scene' 'io_scene_spm'
}
