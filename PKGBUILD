# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=26.3.2352291
pkgrel=2
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('numactl' 'glu' 'libxml2-legacy' 'qt5-tools')
optdepends=('renderman: Downloader for the RPM package')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-26.3_2352291-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('ced24b6c48f6d31f1f474c647d772d3a0f6699c74697c187aaf0e20955daf97efff4a6a84a3df2533c8e983a3a3d8f2a1443ffbff74c1b940b81600f7713577a')

options=(!strip)

prepare() {
    ln -s /usr/lib/libncursesw.so.6 opt/pixar/RenderManProServer-26.3/lib/libncurses.so.6
}

package() {
    mv opt "$pkgdir/"
}
