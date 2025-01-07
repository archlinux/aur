# Maintainer: MYT1 <MYT1 at QQ dot cn>

pkgname=nss_wrapper
pkgver=1.1.16
pkgrel=2
pkgdesc="NSS wrapper library"
arch=("x86_64")
url="http://cwrap.org/nss_wrapper.html"
license=("custom")
makedepends=('git' 'cmake')
depends=('glibc')
provides=('nss_wrapper')
conflicts=('libnss-wrapper-bin' 'libnss-wrapper' 'libnss_wrapper-git')
source=("git+https://git.samba.org/nss_wrapper.git")
sha256sums=("SKIP")

build() {

    cd $pkgname
    install -d build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=</usr> -DLIB_SUFFIX=64 ..
    make
}

package() {
    cd $pkgname/build
    make DESTDIR=$pkgdir/usr install
}
