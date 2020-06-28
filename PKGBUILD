# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgbase=mcmanjaro-kde-git
pkgname=(mcmanjaro-kde-git kvantum-theme-mcmanjaro-git)
_pkgname=mcmanjaro
pkgver=r38.506ac29
pkgrel=1
pkgdesc="A KDE Plasma customize theme"
arch=(any)
url="https://github.com/MiguelRAvila/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_mcmanjaro-kde-git() {
    provides=('mcmanjaro-kde')
    optdepends=('kvantum-theme-mcmanjaro: McManjaro theme for Kvantum Qt style (recommended)'
                'mcmojave-circle-icon-theme-git: Matching icon theme')

    cd $_pkgname

    install -d "$pkgdir"/usr/share

    
    cp -r aurorae "$pkgdir"/usr/share
    cp -r color-schemes "$pkgdir"/usr/share
    cp -r konsole "$pkgdir"/usr/share
    cp -r plasma "$pkgdir"/usr/share
}

package_kvantum-theme-mcmanjaro-git() {
    provides=('kvantum-theme-mcmanjaro')
    pkgdesc="McManjaro theme for KDE Plasma 5"
    depends=(kvantum-qt5)

    cd $_pkgname

    install -d "$pkgdir"/usr/share
    
    mv kvantum Kvantum
    
    cp -r Kvantum "$pkgdir"/usr/share
}
