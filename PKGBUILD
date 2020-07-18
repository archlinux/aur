pkgbase=akava-kde-git
pkgname=(akava-kde-git)
_pkgname=Akava-Theme
pkgver=r6.2a39b4a
pkgrel=1
pkgdesc="Akava Widget KDE/Qt theme"
arch=(any)
url="https://github.com/Akava-Design/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_akava-kde-git() {
    provides=('akava-kde')
    optdepends=('breeze-blurred-git: Matching window decoration'
             'akava-konsole-git: Matching konsole colors theme'
             'akava-colors-git: Matching KDE color theme'
             'kvantum-theme-akava-git: Matching kvantum theme')

    cd $_pkgname
    install -d "${pkgdir}/usr/share"
    mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
    cp -r Akava "${pkgdir}/usr/share/plasma/desktoptheme"
}
