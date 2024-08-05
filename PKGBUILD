# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=zitify-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Wrapper to connect applications to an OpenZiti network'
arch=('x86_64')
url='https://github.com/openziti/zitify'
optdepends=('python: Identity enrollment support')
license=('Apache-2.0')
source=("https://github.com/openziti/zitify/releases/download/v${pkgver}/zitify-${pkgver}-Linux-${arch}.tar.gz"
        "fix-preload-directory.patch")
sha256sums=('149a0b0a89369ccc2257b83c487d0c5f927bf28ff02411e1c62b30ea430c6de3'
            'c5541122c11f3764541636c971695768d8afa0e371019c9a6b6f0f10d935d667')

prepare() {
  patch -i fix-preload-directory.patch
}

package() {
  install -D -m 0755 "zitify" "${pkgdir}/usr/bin/zitify"
  install -D -m 0755 "libzitify.so.${pkgver}" "${pkgdir}/usr/lib/zitify/libzitify.so"
}
