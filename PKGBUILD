# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=sqly
pkgname=${_pkgname}-bin
pkgver=0.25.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Eaisly execute SQL against CSV/TSV/LTSV/JSON and Microsoft Excel™ with shell"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.deb")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.deb")
sha256sums_x86_64=('7ac692991f58a5c5f901b54344b751785942bd0e18cca1952d75f9d85c450fd1')
sha256sums_aarch64=('d6d5b77639b28dc955dd4938068550b089c8878ca322bcaa5277bf494b18e59e')


package() {
    cd "${pkgdir}" || exit

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
