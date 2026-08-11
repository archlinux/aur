# Maintainer: @aardbol
pkgname=ironclaw-bin
_pkgname=ironclaw
pkgver=1.1.0
pkgrel=1
pkgdesc="IronClaw is an Agent OS focused on privacy, security and extensibility"
arch=('x86_64' 'aarch64')
url="https://github.com/nearai/ironclaw"
license=('Apache-2.0')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('408920826755cc996dec4abc755d03d151144bea2fdbb2aecb7c36db0f2a5455')
sha256sums_aarch64=('e6693cc3e752a9a580bc4525474b6a97dc52413cb4c9779a0239e87ac6539203')

package() {
    local target="${_pkgname}-${CARCH}-unknown-linux-gnu"
    tar -xzf "$srcdir/${target}.tar.gz"
    install -Dm755 "$srcdir/$target/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
