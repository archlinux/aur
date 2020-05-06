# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=libsharp
pkgver='1.0.0'
_healpixver='3.60'
pkgrel=2
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
source=("https://downloads.sourceforge.net/project/healpix/Healpix_${_healpixver}/libsharp-${pkgver}.tar.gz")
sha256sums=('e98293315ee0f8a4c69c627bda36297b45e35e7afc33f510756f212d36c02f92')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make -j
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

