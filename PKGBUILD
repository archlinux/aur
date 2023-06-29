# Maintainer: Miroslav Koškár <https://mkoskar.com/>

_basename='tcolors'

pkgname='tcolors-git'
pkgver=r11.fed0e89
pkgrel=1
pkgdesc='Get & Set terminal ANSI colors'
url='https://github.com/mkoskar/tcolors'
license=(Apache)
arch=(any)
depends=(python)
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
    install -d "$pkgdir/usr"
    cp -r --preserve=mode bin "$pkgdir/usr"
}
