# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=NeoHtop
_pkgauthor=Abdenasser
_pkgname=neohtop
pkgname=${_pkgname}-bin
pkgver=1.0.8
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
            '046c79afd1e96c9e6d3a051394c440d8509907215764316f992da3a7cd870754')
sha256sums_x86_64=('449c492e24f9ce106c9c4f69cbf2760dbc984246e53b9ee3d47be6a2dea6097a')
sha256sums_aarch64=('5facfb059d2493a3bc29607164a75350046888e7ac411becf2da5960c6cfa942')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"

    # install LICENSE and README.md
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "./usr/share/doc/${pkgname}/README.md"
} 
