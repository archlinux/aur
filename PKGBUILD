pkgname=polar-gleam-git
_pkgname=polar-gleam

pkgver=r20.1aeea22
pkgrel=1

pkgdesc="Polar Gleam and Polar Dusk theme suite for KDE Plasma 6"
arch=('any')
url="https://bitbucket.org/dirn-typo/polar-gleam"
license=('GPL-3.0-only')

depends=(
    'plasma-workspace'
    'kvantum'
)

makedepends=(
    'git'
)

optdepends=(
    'konsole: use the included Konsole color schemes'
)

provides=('polar-gleam')
conflicts=('polar-gleam')

source=(
    "${_pkgname}::git+https://bitbucket.org/dirn-typo/polar-gleam.git#branch=main"
)

sha256sums=('SKIP')


pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${_pkgname}"

    # Aurorae window decorations
    install -dm755 "${pkgdir}/usr/share/aurorae/themes"

    cp -a --no-preserve=ownership \
        aurorae/. \
        "${pkgdir}/usr/share/aurorae/themes/"

    cp -a --no-preserve=ownership \
        dusk-components/aurorae/. \
        "${pkgdir}/usr/share/aurorae/themes/"


    # KDE color schemes
    install -dm755 "${pkgdir}/usr/share/color-schemes"

    cp -a --no-preserve=ownership \
        color-schemes/. \
        "${pkgdir}/usr/share/color-schemes/"

    cp -a --no-preserve=ownership \
        dusk-components/color-schemes/. \
        "${pkgdir}/usr/share/color-schemes/"


    # Plasma style
    install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme"

    cp -a --no-preserve=ownership \
        desktoptheme/. \
        "${pkgdir}/usr/share/plasma/desktoptheme/"


    # Global themes
    install -dm755 "${pkgdir}/usr/share/plasma/look-and-feel"

    cp -a --no-preserve=ownership \
        look-and-feel/. \
        "${pkgdir}/usr/share/plasma/look-and-feel/"

    cp -a --no-preserve=ownership \
        dusk-components/look-and-feel/. \
        "${pkgdir}/usr/share/plasma/look-and-feel/"


    # Konsole schemes
    install -dm755 "${pkgdir}/usr/share/konsole"

    cp -a --no-preserve=ownership \
        konsole/. \
        "${pkgdir}/usr/share/konsole/"

    cp -a --no-preserve=ownership \
        dusk-components/konsole/. \
        "${pkgdir}/usr/share/konsole/"


    # Kvantum themes
    install -dm755 "${pkgdir}/usr/share/Kvantum"

    cp -a --no-preserve=ownership \
        kvantum/. \
        "${pkgdir}/usr/share/Kvantum/"

    cp -a --no-preserve=ownership \
        dusk-components/kvantum/. \
        "${pkgdir}/usr/share/Kvantum/"


    # Wallpapers
    install -dm755 "${pkgdir}/usr/share/wallpapers"

    cp -a --no-preserve=ownership \
        wallpapers/. \
        "${pkgdir}/usr/share/wallpapers/"
}
