# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgbase=kotki-models-tiny
pkgname=(
    'localtranslate-models-kotki-tiny'
    'kotki-models-tiny'
)
pkgver=0.6.0
_models_ver=0.3.3
pkgrel=3
arch=("any")
url="https://github.com/kroketio/kotki"
license=('MPL-2.0')
source=(
    "$url/releases/download/$pkgver/kotki_models_${_models_ver}-tiny.zip"
)
sha256sums=('5a19cef79a2317767a28decca47c51c8d035e8a35cad976798c1bc2b32205bd4')

# --- LocalTranslate ---

package_localtranslate-models-kotki-tiny() {
    pkgdesc="Kotki's tiny translation models adapted for LocalTranslate"
    provides=("localtranslate-models-base")
    conflicts=("localtranslate-models-base")

    install -dm755 "${pkgdir}/usr/share/localtranslate/models/firefox"
    cp -aT --reflink=auto "${srcdir}/${_models_ver}-tiny/" "${pkgdir}/usr/share/localtranslate/models/firefox/"
}

# --- Kotki ---

package_kotki-models-tiny() {
    pkgdesc="Kotki's tiny translation models for native Kotki library"
    provides=("kotki-models-base")
    conflicts=("kotki-models-base")

    install -dm755 "${pkgdir}/usr/share/kotki/models"
    cp -aT --reflink=auto "${srcdir}/${_models_ver}-tiny/" "${pkgdir}/usr/share/kotki/models/"
}