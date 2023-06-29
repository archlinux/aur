# Maintainer: Miroslav Koškár <https://mkoskar.com/>

_basename='gtk-theme-mist'

pkgname='gtk3-theme-mist-git'
pkgver=r29.130c5ef
pkgrel=1
pkgdesc='GTK 3.x theme matching GTK 2.x Mist theme'
url='https://github.com/mkoskar/gtk-theme-mist'
license=(GPL)
arch=(any)
makedepends=(git)

source=("git+https://github.com/mkoskar/$_basename.git")
sha256sums=(SKIP)

pkgver() {
    cd "$_basename"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" \
                    "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_basename"
    install -d "$pkgdir/usr/share/themes/Mist"
    cp -dr --preserve=mode -t "$pkgdir/usr/share/themes/Mist" Mist/gtk-3.0
}
