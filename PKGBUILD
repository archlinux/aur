# Maintainer: Albert Sebastian <albertsebe2 at gmail dot com>

pkgname=furmark
pkgver=2.0.16
pkgrel=1
pkgdesc='Lightweight but intensive GPU stress test and benchmarking tool for OpenGL and Vulkan'
arch=('x86_64')
url='https://www.geeks3d.com/furmark/v2/'
license=('custom:freeware')
depends=(gcc-libs opengl-driver glu libxcb)
optdepends=('vulkan-driver: Vulkan benchmark support')
makedepends=('unzip')
source=("https://gpumagick.com/downloads/files/2024/furmark2/FurMark_${pkgver}_linux64.zip")
md5sums=('655dbab19f3b734aab4bdd91aa7b4090')

package(){
    cd $srcdir/FurMark_linux64

    install -d "$pkgdir/opt/$pkgname/"
    cp -a ./ "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/furmark" "$pkgdir/usr/bin/furmark"
    ln -s "/opt/$pkgname/Furmark_GUI" "$pkgdir/usr/bin/furmark-gui"

    install -Dm644 "./EULA.txt" "$pkgdir/usr/shar/licenses/$pkgname/EULA.txt"
}
