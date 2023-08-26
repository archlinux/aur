_pkgname=octomap_msgs
pkgname=ros2-humble-octomap-msgs
pkgver=2.0.0
pkgrel=1
pkgdesc="Messages and serializations / conversion for the OctoMap library."
url="https://index.ros.org/p/octomap_msgs/"
arch=('any')
depends=('ros2-humble')
source=("https://github.com/OctoMap/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ef273be4b931eacce289ec664a0515d215e1970954d7818df3151e0f2aa90735')

build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
