# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=libsharp
pkgver='1.0.0'
pkgrel=1
pkgdesc="Library for fast spherical harmonic transforms, see http://arxiv.org/abs/1303.4945"
arch=(any)
url="https://github.com/Libsharp/libsharp"
license=('GPLv2')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ca7cc7790c98bd5637a8a3d84460c02a54e5132b3184e713e596cd70c3cd59c0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoconf
    ./configure --prefix="${pkgdir}/usr"
    make -j
}

package() {
    mkdir ${pkgdir}/usr
    cp -r "${srcdir}/${pkgname}-${pkgver}/auto/"* ${pkgdir}/usr
}

