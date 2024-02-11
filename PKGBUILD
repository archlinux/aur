# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=iosevka-generate
pkgver=0.5.0
pkgrel=1
pkgdesc='A tool to generate custom Iosevka fonts from a configuration file'
url='https://github.com/OJFord/iosevka-generate'
license=('GPL')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('ae0f8ba93243f80f5cb21b29002fe325')
arch=('any')
depends=(
    'npm'
    'otfcc'
    'python-gitpython'
    'python-pyxdg'
    'python-requests'
    'ttfautohint'
)
optdepends=(
    'fontforge: NerdFont patching'
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
