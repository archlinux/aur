# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=backblaze-b2
pkgver=0.3.8
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
sha512sums=('6d59302387a5cda74a3956248cb3e7c2878257798bd26a85cba8781fc0214186851101a9412028f10259bf2e443f3f7630092df8ef8635fa0acd057d9266b3a1')

package() {
    # Hardcode python2, converting is frivilous
    # I started to convert it but after 2to3, decode() I gave up
    sed -ie 's:^#\! /usr/bin/python$:#! /usr/bin/env python2:' b2

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    install -D ${srcdir}/b2 ${pkgdir}/usr/bin/backblaze-b2
}

