# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgbase=krayan-kde-git
pkgname=(krayan-kde-git kvantum-theme-krayan-git)
_pkgname=KrayanKDE
pkgver=r1.e1e2161
pkgrel=2
pkgdesc="A darker and more modern twist on the Layan GTK Theme"
arch=(any)
url="https://github.com/lazerl0rd/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_krayan-kde-git() {
    provides=('krayan-kde')
    optdepends=('krayan-gtk-theme: Matching GTK theme'
                'kvantum-theme-krayan: Layan theme for Kvantum Qt style (recommended)'
                'papirus-icon-theme: Matching icon theme')

    cd $_pkgname

    install -d "$pkgdir"/usr/share

#    rm sddm/{README.md,install.sh}

#    cp -r aurorae "$pkgdir"/usr/share
    cp -r color-schemes "$pkgdir"/usr/share
#    cp -r plasma "$pkgdir"/usr/share
#    cp -r sddm "$pkgdir"/usr/share
}

package_kvantum-theme-krayan-git() {
    provides=('kvantum-theme-krayan')
    pkgdesc="Krayan theme for KDE Plasma 5"
    depends=(kvantum-qt5)

    cd $_pkgname

    install -d "$pkgdir"/usr/share

    cp -r Kvantum "$pkgdir"/usr/share
}
