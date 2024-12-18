# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=26.3.2351688
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('numactl')
optdepends=('renderman: Downloader for the RPM package')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-26.3_2351688-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('7b61bab6c47de6f3fcdaacd3fc7e7171ca902841aee61ed0bba962a5c8b1593a1a864d3a746fa99699680f3206aa572fc075b70adef7148981b5596e456724cc')

options=(!strip)

prepare() {
    ln -s /usr/lib/libncursesw.so.6 opt/pixar/RenderManProServer-26.3/lib/libncurses.so.6
}

package() {
    mv opt "$pkgdir/"
}
