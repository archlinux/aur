# Maintainer: SY Zhang <lastavengers@archlinuxcn.org>

pkgname=ricin
_pkgname=Ricin
pkgver=0.2.9
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
sha256sums=('6a7c999d8e41ed29f5f35b44e859f468313a88821044b78c4d336b3bd24b411a')
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
