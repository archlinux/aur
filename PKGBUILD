# Maintainer: gigas002 <gigas002@pm.me>

pkgname=carbonyl-bin
_pkgname=carbonyl
pkgver=0.0.2
pkgrel=1
pkgdesc="Chromium-based browser built to run in a terminal"
arch=('x86_64')
url="https://github.com/fathyb/carbonyl"
license=('BSD')
provides=("carbonyl")
conflicts=('carbonyl')
options=(!strip)
source=("${_pkgname}-${pkgver}.zip::https://github.com/fathyb/carbonyl/releases/download/v$pkgver/carbonyl.linux-amd64.zip"
        "${_pkgname}.sh")
noextract=("${_pkgname}-${pkgver}.zip")
sha256sums=('53ab641cfa6c31c239db9304e562a68e586f4f522a9156eba84225d1751f17a9'
            '07d6361edfa45d58a2d81e527f1a976fef9ba5417daa0ff8b4acfdfc95f8032e')

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
    bsdtar -xf "${_pkgname}-${pkgver}.zip" -C "${srcdir}/"
    mv ${srcdir}/${_pkgname}-${pkgver}/* ${pkgdir}/opt/${_pkgname}
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
