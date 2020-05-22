# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-tracks-bonus
pkgver=20.0413
pkgrel=2
pkgdesc="Additional RVGL tracks used for special events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-loadlevel: custom load screens'
            'rvgl-io-music: extra music')
makedepends=('git')
conflicts=('rvgl-tracks-bonus')
replaces=('rvgl-tracks-bonus')
groups=('rvgl-community')
source=("rvgl_io_tracks_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_tracks.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_tracks_bonus"

    # Remove conflicting files present in rvgl-tracks
    rm -r gfx/cake.bmp levels/cake

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
