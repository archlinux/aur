# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=backblaze-b2
pkgver=0.3.6
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
url="https://www.backblaze.com/b2/cloud-storage.html"
depends=('python')
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

# Need a better source URL at some point
source=("https://docs.backblaze.com/public/b2_src_code_bundles/b2")
sha512sums=('4be011b5dd12c38a12f8887e009fd0fc25cd5c613d121db07aa9c110cc31fe0fa85e313b7535086559367d7d101b6286fd002814798b98cbe61d6602b80299f3')

package() {
    # Hardcode python2, converting is frivilous
    # I started to convert it but after 2to3, decode() I gave up
    sed -ie 's:^#\! /usr/bin/python$:#! /usr/bin/env python2:' b2

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    install -D ${srcdir}/b2 ${pkgdir}/usr/bin/backblaze-b2
}

