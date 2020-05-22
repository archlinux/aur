# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-tracks
pkgver=20.0413
pkgrel=2
pkgdesc="Additional RVGL tracks used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-loadlevel: custom load screens'
            'rvgl-io-music: extra music')
makedepends=('git')
conflicts=('rvgl-tracks')
replaces=('rvgl-tracks')
groups=('rvgl-community')
source=("rvgl_io_tracks"::git+https://gitlab.com/re-volt/rvio/tracks.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_tracks"

    # Remove conflicting file present in rvgl-tracks-bonus
    rm gfx/playoutside.bmp

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
