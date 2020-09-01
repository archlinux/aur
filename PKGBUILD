pkgname=harmony-kde-git
_pkgname=Harmony-kde
pkgver=r14.71d288a
pkgrel=1
pkgdesc="Harmony-dark kde is a light clean theme for KDE Plasma desktop"
arch=(any)
url="https://github.com/yeyushengfan258/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_harmony-kde-git() {
    provides=('harmony-kde')
    optdepends=('mcmuse-icon-theme: Matching icon theme'
                'mcmuse-circle: matching icon theme')

    cd $_pkgname

    install -d "${pkgdir}/usr/share"

    mkdir -p "${pkgdir}/usr/share/Kvantum"
    mkdir -p "${pkgdir}/usr/share/aurorae/themes"
    mkdir -p "${pkgdir}/usr/share/plasma"
    mkdir -p "${pkgdir}/usr/share/sddm/themes"
    mkdir -p "${pkgdir}/usr/share/wallpapers"

    cp -r Kvantum/* "${pkgdir}/usr/share/Kvantum/"
    cp -r aurorae/* "${pkgdir}/usr/share/aurorae/themes/"
    cp -r color-schemes "${pkgdir}/usr/share/"
    cp -r plasma/* "${pkgdir}/usr/share/plasma/"
    cp -r sddm/Harmony "${pkgdir}/usr/share/sddm/themes/"
    cp -r wallpaper/* "${pkgdir}/usr/share/wallpapers/"
}
