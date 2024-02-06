pkgname=dracut-swap-tpm2-git
_pkgname=dracut-swap-tpm2
pkgver=r3.b3e598d
pkgrel=1
pkgdesc="Dracut module to encrypt swap with hibernation support"
arch=('x86_64')
url="https://github.com/thesola10/dracut-swap-tpm2"
license=('CC0-1.0')
depends=('dracut'
         'tpm2-tools'
         'cryptsetup'
         'util-linux')
makedepends=('git' 'make' 'gettext')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
