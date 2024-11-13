# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: antermin <github dot com slash antermin>

pkgname=python-proton-vpn-local-agent
pkgver=1.1.4
pkgrel=1
_commit=9cc170b5aa3c8d8c9d26d155e1655bf546ea6146
pkgdesc="Proton VPN local agent written in Rust"
arch=('x86_64')
url="https://github.com/ProtonVPN/local-agent-rs"
license=("GPL3")
groups=("ProtonVPN")
depends=('python')
makedepends=('git' 'cargo')
source=("git+https://github.com/ProtonVPN/local-agent-rs.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}"/local-agent-rs/python-proton-vpn-local-agent
    cargo build --release
}

package() {
    mkdir -p "${pkgdir}"/usr/lib/python3.12/site-packages/proton/vpn
    install -Dm755 "${srcdir}"/local-agent-rs/python-proton-vpn-local-agent/target/release/libpython_proton_vpn_local_agent.so "${pkgdir}"/usr/lib/python3.12/site-packages/proton/vpn/local_agent.abi3.so
}
