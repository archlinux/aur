# Maintainer: @aardbol
pkgname=ironclaw-bin
_pkgname=ironclaw
pkgver=1.2.0
pkgrel=1
pkgdesc="IronClaw is an Agent OS focused on privacy, security and extensibility"
arch=('x86_64' 'aarch64')
url="https://github.com/nearai/ironclaw"
license=('Apache-2.0')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('81feea64c17c79228b6b582934011ba96349cbd1c7ecd522780127400b6739e8')
sha256sums_aarch64=('b406203faf462d27276127a2faa11ae0f1d55e00e3b8dd18832d65460c328453')

package() {
    local target="${_pkgname}-${CARCH}-unknown-linux-gnu"
    tar -xzf "$srcdir/${target}.tar.gz"
    install -Dm755 "$srcdir/$target/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
