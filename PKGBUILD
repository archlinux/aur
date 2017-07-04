# Maintainer: Oliver Ford <dev@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=iosevka-generate
pkgver=0.1.1
pkgrel=2
pkgdesc='A tool to generate custom Iosevka fonts from a configuration file'
url='https://github.com/OJFord/iosevka-generate'
license=('GPL')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('7461702546a52709a2b16ffdbec0c111')
arch=('any')
depends=(
    'make'
    'npm'
    'otfcc'
    'python-gitpython'
    'python-xdg'
    'ttfautohint'
)
conflicts=(
    ttf-iosevka-{pack,term,type,slab,term-slab,type-slab}
    ttf-iosevka{,-ss01,-ss02,-ss03,-ss04,-ss05,-ss06,-ss07,-ss07,-ss08,-ss09,-ss10,-ss11}
    ttf-iosevka-term{,-ss01,-ss02,-ss03,-ss04,-ss05,-ss06,-ss07,-ss07,-ss08,-ss09,-ss10,-ss11}
)

package() {
    set -e
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
}
