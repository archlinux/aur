# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=restmate-bin
pkgver=0.1.11
pkgrel=1
pkgdesc='Restmate is a modern lightweight cross-platform Rest API Client, designed to simplify and expedite the testing process for developers.'
arch=('x86_64')
url='https://github.com/aunjaffery/restmate'
#license=('GPL2')
depends=(
        'nodejs'
        )
options=(
    !emptydirs
)
source=(
  "https://github.com/aunjaffery/restmate/releases/download/v${pkgver}/restmate-v${pkgver}.linux-amd64.deb"
)
sha512sums=('dc1b7cb1fd267bebf0b2054c54455af6bc9dccbdddc69891fc5ca472d04175d6ec228022563a54b4f66330034edaab38f590898408ecfe1e849f78cc9bc5d0a5')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

package() {
    cp -a \
        "${srcdir}/usr/" \
        "${pkgdir}/usr/"
}
