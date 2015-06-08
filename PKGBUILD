# Maintainer: Miroslav Koskar (http://mkoskar.com/)

_basename='gtk-theme-mist'
_pkgbuildver=1

pkgname='gtk3-theme-mist-git'
pkgver="r0.0.$_pkgbuildver"
pkgrel=1
pkgdesc='GTK 3.x theme matching GTK 2.x Mist theme'
url='https://github.com/mkoskar/gtk-theme-mist'
license=('GPL')
arch=('any')
makedepends=('git')

source=("git+https://github.com/mkoskar/$_basename.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"
    printf 'r%s.%s.%s' "$(git rev-list --count HEAD)" \
                       "$(git rev-parse --short HEAD)" \
                       "$_pkgbuildver"
}

package() {
    cd "$srcdir/$_basename"
    install -d "$pkgdir"/usr/share/themes/Mist
    cp -dpr Mist/gtk-3.0 "$pkgdir"/usr/share/themes/Mist
}
