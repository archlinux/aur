# Maintainer: Daniel Maksymow <daniel.maksymow@tuta.io>
pkgname=alohomora
pkgver=v1.3.0
pkgrel=2
pkgdesc="Alohomora is a free and open-source password manager"
arch=(x86_64)
url="https://github.com/z0o0p/alohomora"
license=('GPL3')
depends=('granite' 'libsecret')
makedepends=('meson' 'git' 'vala')
_commit=39dab4093d727c26015f639007f2244002c34da1
source=("https://github.com/z0o0p/alohomora/archive/$_commit.zip")
sha256sums=('7756e6c991ab1686120953d0101766316d5b37f9eadbb6f346a244824b298415')

build() {
        arch-meson "$pkgname-$_commit" build
        meson compile -C build
}

check() {
        meson test -C build
}

package() {
          meson install -C build --destdir="$pkgdir"
}
