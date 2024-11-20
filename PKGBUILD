# Maintainer: linduxed <linduxed at protonmail dot com>
# Contributor: Faerbit <faerbit at gmail dot com>
# Contributor: patrick96 <p dot ziegler96 at gmail dot com>
# Contributor: esskayesss <ess at esskayesss dot dev>

_pkgname=exercism
pkgname="${_pkgname}-bin"
pkgver=3.5.4
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
sha256sums_i386=('eb4f162e4c27c7c50bfd5a30833fb84c2c61691d5ffeae5e61da3a076a77b699')
source_x86_64=(${_rel_url}/exercism-${pkgver}-linux-x86_64.tar.gz)
sha256sums_x86_64=('97a18dda052f4766e6b7f1fbfadabf37b32522949516e6416be008c80c068e87')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
