# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=27.1.2389102
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('numactl' 'glu' 'libxml2-legacy' 'qt5-tools')
optdepends=('renderman: Downloader for the RPM package')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-27.1_2389102-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('60b43b9e99ffb9d04ab3909ee0fca77aec88acef7cd9d5c46bbeb50d51aba0563f63261f658d955c56cde36740a23651540cf90d14afcf0ff6a2603839a5b285')

options=(!strip)

prepare() {
    ln -s /usr/lib/libncursesw.so.6 opt/pixar/RenderManProServer-27.1/lib/libncurses.so.6
}

package() {
    mv opt "$pkgdir/"
}
