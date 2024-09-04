# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=26.2.2336968
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('numactl')
optdepends=('renderman: Downloader for the RPM package')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-26.2_2336968-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('1c7cdbcdcd9a4dafb1d57de3fddefb4ad0aebc60d3b83523ef0e4f19d861d79cd1c2b207b29fc5140a083085b7d233066f03ff8cf2b15d7ea2d01083e8deb97b')

options=(!strip)

prepare() {
    ln -s /usr/lib/libncursesw.so.6 opt/pixar/RenderManProServer-26.2/lib/libncurses.so.6
}

package() {
    mv opt "$pkgdir/"
}
