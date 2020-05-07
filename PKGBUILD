# Maintainer: Mark Wells <mwellsa at gmail dot com>
# Maintainer: José San Juan <josesj at gmail dot com>

pkgname=fv
pkgver=5.5.2
pkgrel=1
pkgdesc="Fv is an easy to use graphical program for viewing and editing any FITS format image or table."
arch=('x86_64')
url="https://heasarc.gsfc.nasa.gov/docs/software/ftools/fv/fv_download.html"
source=(
    "https://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/fv/fv${pkgver}_Linux.tar.gz"
    'fv.xpm'
    'fv.desktop'
)
sha256sums=(
    'e20609d7cee142a8bdebaa5d54ce4772844d33d6c9596c4b28e72ba74c5428a2'
    'adcc8b4704d932c6a7d13655a721a8be81a7b7f614f92be657ceb21ade5dd819'
    'b4dee7925f88d025f1403ac3055fc01eb23bd442d2c999f342b381cbd6d086d1'
)

package() {
        mkdir -p ${pkgdir}/opt/fv
        mkdir -p ${pkgdir}/etc/profile.d
        cp -r ${srcdir}/fv${pkgver}/* ${pkgdir}/opt/fv/
        install -Dm644 fv.desktop "$pkgdir/usr/share/applications/fv.desktop"
        install -Dm644 fv.xpm "$pkgdir/usr/share/pixmaps/fv.xpm"
        echo 'export PATH="$PATH":/opt/fv' > ${pkgdir}/etc/profile.d/fv.sh
        source ${pkgdir}/etc/profile.d/fv.sh
}
