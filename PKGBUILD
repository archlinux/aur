# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=27.0.2386582
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('numactl' 'glu' 'libxml2-legacy' 'qt5-tools')
optdepends=('renderman: Downloader for the RPM package')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-27.0_2386582-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('bc1d65e2b3f64893570cb1e7fd82a24f31758fc0217708fc0c6d4c8ad3ca25b876d00499ff2a635505e6ec33fad236a9150e17db01c8163755010b4b73697cfa')

options=(!strip)

prepare() {
    ln -s /usr/lib/libncursesw.so.6 opt/pixar/RenderManProServer-27.0/lib/libncurses.so.6
}

package() {
    mv opt "$pkgdir/"
}
