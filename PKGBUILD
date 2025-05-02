# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=restmate-bin
pkgver=0.1.11
pkgrel=1
pkgdesc='Restmate is a modern lightweight cross-platform Rest API Client, designed to simplify and expedite the testing process for developers.'
arch=('x86_64')
url='https://github.com/aunjaffery/restmate'
license=('MIT')
depends=(
        'hicolor-icon-theme'
        'libsoup3'
        'gtk3'
        'gdk-pixbuf2'
        'glib2'
        'glibc'
        'webkit2gtk-4.1'
        )
options=(
    !emptydirs
)
source=(
  "https://github.com/aunjaffery/restmate/releases/download/v${pkgver}/restmate-v${pkgver}.linux-amd64.deb"
  "https://raw.githubusercontent.com/aunjaffery/restmate/refs/heads/master/LICENSE"
)
sha512sums=('dc1b7cb1fd267bebf0b2054c54455af6bc9dccbdddc69891fc5ca472d04175d6ec228022563a54b4f66330034edaab38f590898408ecfe1e849f78cc9bc5d0a5'
            'c8cd98cc277737d353888d62a3e5979227d4b6e7fc6b24bb6e14126ee6b86112278bbf7cb62abb823d22cf3d793d3acbd0ae006aa4c2196738d1000d00ffd69f')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

package() {
    cp -a \
        "${srcdir}/usr/" \
        "${pkgdir}/usr/"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/restmate-bin/" "${srcdir}/LICENSE"
}
