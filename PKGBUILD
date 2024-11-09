# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=NeoHtop
_pkgauthor=Abdenasser
_pkgname=neohtop
pkgname=${_pkgname}-bin
pkgver=1.0.9
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
            '7f093c348427338300849281c50993d64ebb2d1e227a5283ce78577b31d1c9e0')
sha256sums_x86_64=('e90c7bd1e294fa0a8768b1a7039484978d166c9cf56380e3fb35a6c48997b874')
sha256sums_aarch64=('d7bcfc6aa5e96e76494628b79d21bfe0a985707a38495cc50e31bca24437f699')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"

    # install LICENSE and README.md
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "./usr/share/doc/${pkgname}/README.md"
} 
