# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>

pkgname=gli
pkgver=0.7.0.0
pkgrel=1
pkgdesc="OpenGL Image (GLI) is a header only C++ image library for graphics software"
arch=('any')
license=('MIT')
url="http://gli.g-truc.net"
depends=('glm>=0.9.7.0')
source=("https://github.com/g-truc/gli/archive/$pkgver.tar.gz")
sha512sums=('5d8874081f25c30a761edec9282486d2b8ee9e2b7915c14f140daff0a28c89cf5f35430e84d4f4eca7e66a563ddcfd0d9b8e76b9d7352f0b609691460036776e')

package() {
    cd $pkgname-$pkgver
    mkdir -p $pkgdir/usr/include/gli
    cp -r gli $pkgdir/usr/include
    rm -f $pkgdir/usr/include/gli/CMakeLists.txt
    find $pkgdir -type f -exec chmod 644 {} \;
    find $pkgdir -type d -exec chmod 755 {} \;
}
