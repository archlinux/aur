# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgbase=sunset-dark-kde-git
pkgname=(sunset-dark-kde-git kvantum-theme-sunset-dark-git)
_pkgname=sunset-kde
pkgver=r3.ab72f40
pkgrel=1
pkgdesc="Sunset kde is a light clean theme for KDE Plasma desktop"
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

package_sunset-dark-kde-git() {
    provides=('sunset-dark-kde')
    optdepends=('kvantum-theme-sunset-dark: Sunset Dark theme for Kvantum Qt style (recommended)')

    cd $_pkgname

    install -d "$pkgdir"/usr/share

    mkdir -p "$pkgdir"/usr/share/sddm/themes
    
    cp -r aurorae "$pkgdir"/usr/share
    cp -r color-schemes "$pkgdir"/usr/share
    cp -r plasma "$pkgdir"/usr/share
    cp -r sddm-dark/Sunset-dark "$pkgdir"/usr/share/sddm/themes
}

package_kvantum-theme-sunset-dark-git() {
    provides=('kvantum-theme-sunset-dark')
    pkgdesc="Sunset Dark theme for KDE Plasma 5"
    depends=(kvantum-qt5)

    cd $_pkgname

    install -d "$pkgdir"/usr/share

    cp -r Kvantum "$pkgdir"/usr/share
}
