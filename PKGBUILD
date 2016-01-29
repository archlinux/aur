# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=backblaze-b2
pkgver=0.3.10
pkgrel=3
pkgdesc="Backblaze B2 Command Line Client"
url="https://www.backblaze.com/b2/cloud-storage.html"
depends=('python2')
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

# Need a better source URL at some point
source=("https://github.com/Backblaze/B2_Command_Line_Tool/archive/v0.3.10.tar.gz")
sha512sums=('1148714390c0d578bb8a674704aa87b3e00e367481bb8584c6f16d2b16820b4f8b5f46836572c431f6eae2b1eb3c688467288b4e1c3422f3d8d9ec688919c5bc')

package() {
    cd ${srcdir}/B2_Command_Line_Tool-${pkgver}

    # Hardcode python2, converting is frivilous
    # I started to convert it but after 2to3, decode() I gave up
    sed -ie 's:^#!/usr/bin/env\s\+python$:#!/usr/bin/env python2:' b2

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    install -D b2 ${pkgdir}/usr/bin/backblaze-b2
}

