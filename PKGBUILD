# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-dcpack
pkgver=20.0430a
pkgrel=3
pkgdesc="Dreamcast content pack for RVGL."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
makedepends=('git')
groups=('rvgl-basic' 'rvgl-original' 'rvgl-community')
source=("rvgl_dcpack"::git+https://gitlab.com/re-volt/rvgl-dcpack.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_dcpack"

    # Enable dreamcast car selection box layout
    # for file in frontend.fin frontend.fob; do
    #     mv levels/frontend/custom/dc/$file levels/frontend/custom
    # done

    # Add BigVolt and BossVolt to default car selection box layout
    mv levels/frontend/frontend.fob levels/frontend/custom

    # Remove conflicting files shipped with game
    rm gfx/roof.bmp gfx/roof.bmq # levels/frontend/frontend.fob

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
