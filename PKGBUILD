# Maintainer: Daniel Maksymow <daniel.maksymow@tuta.io>
pkgname=alohomora
pkgver=v1.3.0
pkgrel=1
pkgdesc="Alohomora is a free and open-source password manager"
arch=(x86_64)
url="https://github.com/z0o0p/alohomora"
license=('GPL3')
depends=('granite' 'libsecret')
makedepends=('meson' 'git')
_commit=131d82a8e6fa30a129422fd8b63bd9d54bcc5ea0
source=("https://github.com/z0o0p/alohomora/archive/$_commit.zip")
sha256sums=('e651c2b58651a488cfcde95f91dc73b0fcd1c7515592b0639f57a283bda9f047')

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