# Maintainer: Yichao Zhou <broken.zhou@gmail.com>
pkgname=upcxx
pkgver=2019.3.0
pkgrel=0
pkgdesc="UPC++ is a C++ library that supports Partitioned Global Address Space (PGAS) programming."
url="https://bitbucket.org/berkeleylab/upcxx/wiki/Home"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
optdepends=()
makedepends=()
replaces=()
provides=()
source=(
  https://bitbucket.org/berkeleylab/upcxx/downloads/upcxx-${pkgver}-offline.tar.gz
  upcxx.sh
)
md5sums=('SKIP' 'SKIP')


build() {
    ls
    # echo "export PATH='$PATH'"
    # cd upcxx-${pkgver}-offline
    # rm -rf ins
    # mkdir ins
    # ./install ins
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r ${srcdir}/upcxx-${pkgver}-offline/ins "${pkgdir}/opt/upcxx"
    install -Dm755 "${srcdir}/${source[1]}" "${pkgdir}/etc/profile.d/upcxx.sh"
}
