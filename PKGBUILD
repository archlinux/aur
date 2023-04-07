
pkgname=dds10-thumbnailer-kde-git
pkgver='1'
pkgrel=1
pkgdesc='dds10-thumbnailer-kde is a plugin for KDE 5 that creates thumbnail for Direct Draw Surface (DDS) images'
arch=('x86_64')
license=('GPLv2')
url=https://github.com/meyraud705/dds10-thumbnailer-kde
makedepends=('cmake' 'extra-cmake-modules' 'kdelibs4support')
depends=('qt5-base' 'kio')
source=("${pkgname%-git}::git+https://github.com/meyraud705/dds10-thumbnailer-kde.git")
sha256sums=('SKIP')


build() {
    cmake -B build -S "${pkgname%-git}" -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package(){
    install -D -m644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}" "${pkgname%-git}/LICENSE"
    DESTDIR="$pkgdir" cmake --install build
}




