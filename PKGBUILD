# Maintainer: gigas002 <gigas002@pm.me>

pkgname=carbonyl-bin
_pkgname=carbonyl
pkgver=0.0.3
pkgrel=2
pkgdesc="Chromium-based browser built to run in a terminal"
arch=('x86_64')
url="https://github.com/fathyb/carbonyl"
license=('BSD')
provides=("carbonyl")
conflicts=('carbonyl')
options=(!strip)
depends=(nss alsa-lib)
source=("${_pkgname}-${pkgver}.zip::https://github.com/fathyb/carbonyl/releases/download/v$pkgver/carbonyl.linux-amd64.zip"
        "${_pkgname}.sh")
noextract=("${_pkgname}-${pkgver}.zip")
sha256sums=('46a902ea29bb32f773fb4ee341423705b92345a810422b8df93eaea6a1ec7ad2'
            '07d6361edfa45d58a2d81e527f1a976fef9ba5417daa0ff8b4acfdfc95f8032e')

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
    bsdtar -xf "${_pkgname}-${pkgver}.zip" -C "${srcdir}/"
    mv ${srcdir}/${_pkgname}-${pkgver}/* ${pkgdir}/opt/${_pkgname}
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
