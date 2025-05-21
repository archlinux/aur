# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=restmate-bin
pkgver=0.1.12
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
sha512sums=('f9219060245391a8b3e2f62e88b8e5a40962cc176b1753456c0f0262348d747808ce3ba50788d9c29f6e61a08260923fbadbab588f0de0aa11110da3531b03c9'
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
