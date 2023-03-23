# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-binaries
pkgname="${_pkgname}-bin"
pkgver=1.1.13
pkgrel=1
pkgdesc="The Nym Privacy Platform binaries"
arch=('x86_64')
url="https://github.com/nymtech/nym"
license=('Apache 2.0')
_sources=(
    explorer-api            e399fbb51a51585e162de8e9516531226708e6a3ca86a62006ac5a468214aeed
    nym-api                 4645450458a25382c92912b691451305b6da0e172b23bf69608656199341b59f
    nym-cli                 b5112acb8a4e803a97e5baeb9ced51c0317816c21220ebb445ced982ed58209f
    nym-client              8c2c7a96e6b2bd1e9e1ca0bfc370f981da2f230fbf131e90113487caf32b59ff
    nym-gateway             734f9002a9dfb4e0b5e12289f94d3aab5035fc26febe047abc9bb4307bc76c4e
    nym-mixnode             fc15e9168e02708040063a6da55b4ede6a67c50ee47921bb8854f70dd21d5b16
    nym-network-requester   bf1fefab2998f0e802cd739924c5bb3ea8e7b3de47e0729702e408ae13cbe410
    nym-network-statistics  e74ae5501b82229f53e8d86746cda2180906daa9bea352646fb745e9fade4a14
    nym-socks5-client       b59e4d37bad5352b016b2f12f6e0848f7065c18057c06dab5c2d80b5162708c3
)
source_x86_64=()
sha256sums_x86_64=()
for ((i=0; i<${#_sources[*]}; i=i+2)); do
    source_x86_64+=("https://github.com/nymtech/nym/releases/download/nym-binaries-v${pkgver}/${_sources[i]}")
    sha256sums_x86_64+=(${_sources[i+1]})
done

package() {
    for ((i=0; i<${#_sources[*]}; i=i+2)); do
        install -Dm755 "${_sources[i]}" "${pkgdir}/usr/bin/${_sources[i]}"
    done
    chmod 755 "${pkgdir}/usr/bin"
}
