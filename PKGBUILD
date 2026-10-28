# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgbase=kotki-models-standard
pkgname=(
    'localtranslate-models-kotki-standard'
    'kotki-models-standard'
)
pkgver=0.6.0
_models_ver=0.3.3
pkgrel=3
arch=("any")
url="https://github.com/kroketio/kotki"
license=('MPL-2.0')
source=(
    "$url/releases/download/$pkgver/kotki_models_${_models_ver}.zip"
)
sha256sums=('a38e2534a400f1bab6099dfe162b367e7495bf1782616fb90fac9ae68d7aedb0')

# --- LocalTranslate ---

package_localtranslate-models-kotki-standard() {
    pkgdesc="Kotki's standard translation models adapted for LocalTranslate"
    provides=("localtranslate-models-base")
    conflicts=("localtranslate-models-base")

    install -dm755 "${pkgdir}/usr/share/localtranslate/models/firefox"
    cp -aT --reflink=auto "${srcdir}/${_models_ver}/" "${pkgdir}/usr/share/localtranslate/models/firefox/"
}

# --- Kotki ---

package_kotki-models-standard() {
    pkgdesc="Kotki's standard translation models for native Kotki library"
    provides=("kotki-models-base")
    conflicts=("kotki-models-base")

    install -dm755 "${pkgdir}/usr/share/kotki/models"
    cp -aT --reflink=auto "${srcdir}/${_models_ver}/" "${pkgdir}/usr/share/kotki/models/"
}