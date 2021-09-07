# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=age-bin
pkgver=v1.0.0
pkgrel=1
pkgdesc="A simple, modern and secure encryption tool (and Go library) with small explicit keys, no config options, and UNIX-style composability."
arch=('x86_64' 'aarch64')
url="https://github.com/FiloSottile/age"
license=('BSD')
depends=()
makedepends=()
provides=('age')
conflicts=('age-git' 'age')
source_x86_64=("https://github.com/FiloSottile/age/releases/download/${pkgver}/age-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/FiloSottile/age/releases/download/${pkgver}/age-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('6414f71ce947fbbea1314f6e9786c5d48436ebc76c3fd6167bf018e432b3b669')
sha256sums_aarch64=('6c82aa1d406e5a401ec3bb344cd406626478be74d5ae628f192d907cd78af981')

package() {
    cd "${srcdir}/age"

    # Install age
    install -D -m0755 age \
        "${pkgdir}/usr/bin/age"

    # Install age-keygen
    install -D -m0755 age-keygen \
        "${pkgdir}/usr/bin/age-keygen"
}
