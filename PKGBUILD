# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-dcpack
pkgver=20.0325
pkgrel=1
pkgdesc="RVGL dreamcast content pack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/rvgl_dcpack.zip")
sha256sums=('57da869de425a3836e9f50067d27a4ccf1401dc23d7f4525b4da333e6cf14b37')

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
