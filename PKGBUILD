# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=backblaze-b2sync
pkgver=0.6.0.4
pkgrel=1
pkgdesc="Backblaze B2 Sync Tool"
url="https://www.backblaze.com/b2/docs/b2sync.html"
depends=()
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

# Need a better source URL at some point
source=("https://www.backblaze.com/b2/docs/b2sync_src.zip")
sha512sums=('72010aefe6bc3f952f2c0230cf4d36f8ba88764e25e6cfced572ffdc462bc971df3df34cc359a39b14c5cbc417c7e8a0aa8a889c0f5064cfa165b6a1f1ccef60')

build() {
    cd ${srcdir}/b2sync_src

    # Backblaze fails to link with default LDFLAGS, hopefully backblaze will
    # fix the Makefile headache.
    LDFLAGS="" make
}

package() {
    cd ${srcdir}/b2sync_src

    install -D b2sync ${pkgdir}/usr/bin/b2sync
}

