# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=materia-blur-kde
pkgbase_orig=materia-kde
pkgname=(materia-blur-kde kvantum-theme-materia-blur)
pkgver=20200312
pkgrel=2
pkgdesc="Materia Blur (discontinued) theme for KDE Plasma 5"
arch=(any)
url="https://github.com/PapirusDevelopmentTeam/${pkgbase_orig}"
license=(GPL3)
options=(!strip)
source=(${url}/archive/${pkgver}/${pkgbase_orig}-${pkgver}.tar.gz)
sha256sums=('1d64af417a426ea0c73c55eef8e90e6e96af69e73cda8d35f16c7c0740ef187f')

package_materia-blur-kde() {
    depends=(materia-kde)
    optdepends=('materia-gtk-theme: Matching GTK theme'
                'kvantum-theme-materia-blur: Materia theme for Kvantum Qt style (recommended)')

    cd ${pkgbase_orig}-${pkgver}
    install -d "${pkgdir}"/usr/share/plasma/desktoptheme

    cp -r plasma/desktoptheme/Materia-Blur "${pkgdir}"/usr/share/plasma/desktoptheme
    cp -r plasma/desktoptheme/Materia-Blur-Mono "${pkgdir}"/usr/share/plasma/desktoptheme
}

package_kvantum-theme-materia-blur() {
    pkgdesc="Materia Blur (discontinued) theme for KDE Plasma 5"
    depends=(kvantum)

    cd ${pkgbase_orig}-${pkgver}
    install -d "${pkgdir}"/usr/share/Kvantum

    cp -r Kvantum/MateriaBlur "${pkgdir}"/usr/share/Kvantum
}
