pkgname=chicago95-sddm-theme-git
_pkgname=Chicago95
pkgver=r435.ee42290
pkgrel=1
pkgdesc="SDDM theme and KDE splash screen from Chicago95 theme set"
arch=(any)
url="https://github.com/grassmunk/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_chicago95-sddm-theme-git() {
    provides=('chicago95-sddm-theme')

    cd $_pkgname

    mkdir -p "${pkgdir}/usr/share/sddm/themes"
    mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel/"

    cp -r KDE/Splash/chicago95.splashscreen "${pkgdir}/usr/share/plasma/look-and-feel/"
    tar -xzf KDE/SDDM/Chicago95.tar.gz -C "${pkgdir}/usr/share/sddm/themes/"
}
