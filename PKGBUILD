# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=NeoHtop
_pkgauthor=Abdenasser
_pkgname=neohtop
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="💪🏻 htop on steroids"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_${arch[0]}.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_${arch[1]}.deb")

sha256sums=('af4f1ed4ec165eb087e3caf30c9b7f68779adfd739ec4a771975fd51db1d5671'
            'af4bd5f3a78047de6634d2c7c5b5b7b5cd1a2bd82e7a69d467fc411643188f03')
sha256sums_x86_64=('f62e01f4f26a98fa751cfd9f8555f939ce91a2100a43c815cbfffbbe8afe869b')
sha256sums_aarch64=('4dfaf77a78858e633af27a5ae77bd8d534c4ee23bd82f17edcf911764145aa47')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"

    # install LICENSE and README.md
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "./usr/share/doc/${pkgname}/README.md"
} 
