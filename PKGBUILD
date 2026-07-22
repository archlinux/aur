# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=hermes-decomp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A powerful decompiler that lets you reverse-engineer React Native mobile apps by converting their compiled Hermes bytecode (.hbc) files back into readable JavaScript"
arch=('x86_64')
url="https://github.com/SymbioticSec/hermes-decomp"
license=('MIT')
provides=('hermes-decomp')
conflicts=('hermes-decomp')
depends=('glibc')
options=('!debug')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/SymbioticSec/hermes-decomp/releases/download/v${pkgver}/hermes-decomp-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('bb3fde42a004114c5864b895edb0ca3260ae09a6a5040554a2a6ece70210bb5e')

latestver() {
    gh api repos/SymbioticSec/hermes-decomp/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/hermes-decomp" "${pkgdir}/usr/bin/hermes-decomp"
}
