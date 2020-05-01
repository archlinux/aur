# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-dcpack
pkgver=20.0430
pkgrel=1
pkgdesc="RVGL dreamcast content pack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/rvgl_dcpack.zip")
sha256sums=('69abd2de92fafa2aacea47f4cb9b4603a888ad3f753f56af886805e6555ad956')

package() {
    # Enable dreamcast car selection box layout
    # for file in frontend.fin frontend.fob
    # do
    #     mv levels/frontend/custom/dc/$file levels/frontend/custom
    # done

    # Remove conflicting files shipped with game
    rm gfx/roof.bmp gfx/roof.bmq # levels/frontend/frontend.fob

    # Add BigVolt and BossVolt to default car selection box layout
    mv levels/frontend/frontend.fob levels/frontend/custom

    find cars gfx levels models wavs -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
