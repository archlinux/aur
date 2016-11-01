# Maintainer: SY Zhang <lastavengers@archlinuxcn.org>

pkgname=ricin
_pkgname=Ricin
pkgver=0.2.6
pkgrel=1
pkgdesc="A dead-simple but powerful Tox client."
url="https://ricin.im/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'vala' 'python' 'intltool')
depends=('gtk3'
         'toxcore'
         'glib2'
         'json-glib'
         'libsoup'
         'libnotify'
         )

source=("https://github.com/RicinApp/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8dbee6f8413135a2709ad5641eb0707b6ea84e64d7d85e01f3f016d54ffd6487')
provides=('ricin')
conflicts=('ricin-git')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./waf distclean
    ./waf configure --prefix=${pkgdir}/usr build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./waf install
}
