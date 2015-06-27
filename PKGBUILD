# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
pkgname=dontmove-hib
pkgver=1.3
pkgrel=2
pkgdesc='Ninjas, failure, ludonarrative dissonance and player investment manipulation'
arch=('i686' 'x86_64')
url='http://www.steverichey.com/portfolio/dont-move/'
license=(custom:commercial)
depends_x86_64=('lib32-glibc' 'lib32-gcc-libs')
source=('dontmove.sh' 'dontmove.desktop'
        'dontmove.png::http://media.slidedb.com/images/games/1/25/24384/am_Official_HD_Icon_Faded_512.png')
source_i686=('hib://DontMove_v1-3_Linux-32.tar')
source_x86_64=('hib://DontMove_v1-3_Linux-64.tar')
md5sums=('c649e1c3160c6c452d39ad1ca05deb48'
         'a598147fb87e07dc86db2b3394666f03'
         '204247c9c25b68b3c50bcfb68e16e93b')
md5sums_i686=('5e5aee1e2ca9a4b9bd15a47981982867')
md5sums_x86_64=('ae78a7b9c5c4442733ee87f64855b495')

package () {
    cd "${srcdir}"
    install -d "${pkgdir}/opt/dontmove"
    install -m755 -t "${pkgdir}/opt/dontmove/" DontMove lime.ndll  manifest  regexp.dso  std.dso  zlib.dso

    install -Dm755 dontmove.sh "${pkgdir}/usr/bin/dontmove"
    install -Dm644 dontmove.desktop "${pkgdir}/usr/share/applications/dontmove.desktop"
    install -Dm644 dontmove.png "${pkgdir}/usr/share/pixmaps/dontmove.png"
}
