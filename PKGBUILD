pkgname=flat-remix-kde-git
_pkgname=flat-remix-kde
pkgver=r32.18ac464
pkgrel=1
pkgdesc="Flat Remix KDE themes"
arch=(any)
url="https://github.com/daniruiz/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_flat-remix-kde-git() {
    provides=('flat-remix-kde')
    optdepends=('flat-remix: Matching icon theme'
                'flat-remix-gtk: Matching GTK theme')

    cd $_pkgname

    install -d "$pkgdir"/usr/share
    cp -r aurorae "$pkgdir"/usr/share
    cp -r color-schemes "$pkgdir"/usr/share
    cp -r plasma "$pkgdir"/usr/share
}
