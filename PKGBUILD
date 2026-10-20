# Maintainer: linduxed <linduxed at protonmail dot com>
# Contributor: Faerbit <faerbit at gmail dot com>
# Contributor: patrick96 <p dot ziegler96 at gmail dot com>
# Contributor: esskayesss <ess at esskayesss dot dev>

_pkgname=exercism
pkgname="${_pkgname}-bin"
pkgver=3.5.9
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/exercism/cli"
provides=("exercism")
# URL for release downloads
_rel_url="${url}/releases/download/v${pkgver}"
conflicts=(exercism)
replaces=("exercism-cli")
license=("MIT")

source_i686=(${_rel_url}/exercism-${pkgver}-linux-i386.tar.gz)
sha256sums_i686=('02073a0fa76ddd2e19a0b62e260eaebb48cc4c5ae52426aa02850d7ef00729c6')
source_x86_64=(${_rel_url}/exercism-${pkgver}-linux-x86_64.tar.gz)
sha256sums_x86_64=('c1e1f71451e34575afe9c83d0b9a4a0d1497b0f57f2016679bed3773f89f867d')
# upstream publishes no GOARM=7 build; the ARMv6 binary runs on ARMv7 (v7 is backwards compatible)
source_armv7h=(${_rel_url}/exercism-${pkgver}-linux-armv6.tar.gz)
sha256sums_armv7h=('82477a516c2154bbadcfabef37b4ffc509b4e0dcfe71fbe4fb81259122e25171')
source_aarch64=(${_rel_url}/exercism-${pkgver}-linux-arm64.tar.gz)
sha256sums_aarch64=('f4959f5bfa6ee4b2ac198b103a92d23c7be0bd39bd0e7ace02962ad7d7ad846a')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
