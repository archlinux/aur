# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-loadlevel
pkgver=18.0326
pkgrel=2
pkgdesc="Loading screens for RVGL community tracks."
url='https://re-volt.io/downloads/packs'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-tracks: additional tracks for official events'
            'rvgl-io-tracks-bonus: additional tracks'
            'rvgl-io-tracks-circuit: circuit tracks')
makedepends=('git')
conflicts=('rvgl-loadlevel')
replaces=('rvgl-loadlevel')
groups=('rvgl-community')
source=("rvgl_io_loadlevel"::git+https://gitlab.com/re-volt/rvio/loadlevel.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_loadlevel"

    # Remove conflicting files present in tracks pack
    rm -r levels/industry

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
