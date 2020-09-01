pkgname=kvantum-theme-akava-git
_pkgname=Akava-Kv
pkgver=r14.0c22434
pkgrel=1
pkgdesc="User oriented Kvantum theme for KDE"
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

package_kvantum-theme-akava-git() {
    provides=('kvantum-theme-akava')

    cd $_pkgname
    install -d "${pkgdir}/usr/share"
    mkdir -p "${pkgdir}/usr/share/Kvantum"
    cp -r Akava-Kv "${pkgdir}/usr/share/Kvantum"
}
