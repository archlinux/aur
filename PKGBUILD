# Maintainer: Jack Wu <origincoder@yahoo.com>

pkgname=zorin-desktop-themes
pkgver=2.0.8
pkgrel=2
pkgdesc="The Zorin OS desktop theme provided in a variety of color combinations."
arch=('any')
url="https://github.com/ZorinOS/zorin-desktop-themes"
license=('GPL2')
depends=()
makedepends=()
provides=('zorin-desktop-themes')
conflicts=('zorin-desktop-themes-git')
source=(
        "$pkgname-$pkgver.tar.xz::https://github.com/ZorinOS/$pkgname/archive/$pkgver.tar.gz"
)
sha512sums=(
    'f691f53c7092e46b9993a0cdf204986805f997ed63c46718a0f5fecc32260d68e6ee547f8e7ed5cd29028865c2c17855205b3d689fb23e72a50ce81ef7618285'
)

package() {
    cd "$pkgname-$pkgver"
    
    install -dm755 "$pkgdir/usr/share/themes"
    for theme in $(ls --hide={debian,LICENSE,README.md})
    do
        cp -r $theme "$pkgdir/usr/share/themes/"
    done
}
