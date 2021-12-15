# Maintainer: Ivan Sosnov <ivanmsosnov@gmail.com>

pkgbase=apus-kde-git
pkgname=(apus-kde-git)
_pkgname=apus
pkgver=r9.427a6e0
pkgrel=1
pkgdesc="A dark lilac theme for KDE Plasma desktop"
arch=(any)
url="https://gitlab.com/jomada/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    provides=('apus-kde')

    cd $_pkgname

    install -d "$pkgdir"/usr/share

    mkdir -p plasma/desktoptheme
    mkdir -p aurorae/themes
    mv Apus plasma/desktoptheme/Apus 
    mv aurorae/Apus aurorae/themes/Apus


    cp -r color-schemes "$pkgdir"/usr/share
    cp -r konsole "$pkgdir"/usr/share
    cp -r plasma "$pkgdir"/usr/share
    cp -r wallpaper "$pkgdir"/usr/share
    cp -r plasma "$pkgdir"/usr/share
    cp -r aurorae "$pkgdir"/usr/share
}
