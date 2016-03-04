# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname=nemo-filename-repairer
pkgver=2.8.0
_mintrel=rosa
pkgrel=1
pkgdesc="Nemo extension for filename encoding repair"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo')
makedepends=('gnome-common')
install="${pkgname}.install"

source=("http://packages.linuxmint.com/pool/main/n/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('f311349f2449b2fb05bd7bb64130189e4940108eef61c709eb6d4e9e279590a3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}+${_mintrel}"
    ./autogen.sh
    ./configure --prefix="/usr" --sysconfdir="/etc"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}+${_mintrel}"
    make DESTDIR="${pkgdir}" install
}
