# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=backblaze-b2
pkgver=0.3.10
pkgrel=2
pkgdesc="Backblaze B2 Command Line Client"
url="https://www.backblaze.com/b2/cloud-storage.html"
depends=('python')
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

# Need a better source URL at some point
source=("https://docs.backblaze.com/public/b2_src_code_bundles/b2")
sha512sums=('9abdd9c1009d81b002f39746e18b8a53fd13f241aead2cb9aadf143904defaf64e9571b8639488b3f302d5ba3cd6bb370a23a9a59760f1281245c82165a32d06')

package() {
    # Hardcode python2, converting is frivilous
    # I started to convert it but after 2to3, decode() I gave up
    sed -ie 's:^#!/usr/bin/env\s\+python$:#!/usr/bin/env python2:' b2

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    install -D ${srcdir}/b2 ${pkgdir}/usr/bin/backblaze-b2
}

