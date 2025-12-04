# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-tracks-bonus
pkgver=25.0902
pkgrel=1
pkgdesc="Additional RVGL tracks used for special events."
url='https://re-volt.io/online/tracks/bonus'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-music: extra music'
            'rvgl-io-loadlevel: custom load screens')
makedepends=('git')
conflicts=('rvgl-tracks-bonus')
replaces=('rvgl-tracks-bonus')
groups=('rvgl-bonus')
source=("rvgl_io_tracks_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_tracks.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_tracks_bonus"

    # Remove content conflicting with rvgl-io-tracks-circuit
    rm -r levels/room12x16
    rm gfx/room12x16.bmp

    # Fix filenames
    mv levels/pmt_buoy/custom/jet.WAV levels/pmt_buoy/custom/jet.wav

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
