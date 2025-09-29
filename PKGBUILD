# Maintainer: linduxed <linduxed at protonmail dot com>
# Contributor: Faerbit <faerbit at gmail dot com>
# Contributor: patrick96 <p dot ziegler96 at gmail dot com>
# Contributor: esskayesss <ess at esskayesss dot dev>

_pkgname=exercism
pkgname="${_pkgname}-bin"
pkgver=3.5.8
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
provides=("exercism")
# URL for release downloads
_rel_url="${url}/releases/download/v${pkgver}"
conflicts=(exercism)
replaces=("exercism-cli")
license=("MIT")

source_i386=(${_rel_url}/exercism-${pkgver}-linux-i386.tar.gz)
sha256sums_i386=('bde255a1efb4b1593bc659e0ece14ab1c32c08c6f563e453440542944a0617d7')
source_x86_64=(${_rel_url}/exercism-${pkgver}-linux-x86_64.tar.gz)
sha256sums_x86_64=('4ce6a3e5e41e4c51606f8cb94ef6b46e8f45144ef8c613c1ea4b8b69209e02ad')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
