# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="ecgpuwave"
pkgver="1.3.3"
pkgrel="1"
pkgdesc="Physionet QRS detector and waveform limit locator"
url="http://physionet.org/physiotools/ecgpuwave/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('wfdb')
makedepends=('gcc-fortran')
optdepends=('wfdb-samples')
changelog="ChangeLog"
source=("${pkgname}.tar.gz::http://www.physionet.org/physiotools/${pkgname}/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('cd95be64a25d846b696aac8162f0162b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    mkdir -p "${pkgdir}/usr/bin"

    make prefix="${pkgdir}/usr" install

    make check || exit 1
}

# vim:set ts=4 sw=4 et:
