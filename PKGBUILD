# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-local-agent-bin
pkgver=1.2.0
pkgrel=2
pkgdesc='A python module which implements a client for the Proton Local Agent API.'
arch=('x86_64' 'aarch64')
conflicts=('python-proton-vpn-local-agent')
provides=('local_agent.abi3.so')
url="https://github.com/ProtonVPN/local-agent-rs"
license=('GPL3')

source_x86_64=("https://repo.protonvpn.com/debian/dists/stable/main/binary-amd64/python3-proton-vpn-local-agent_${pkgver}_amd64.deb")
source_aarch64=("https://repo.protonvpn.com/debian/dists/stable/main/binary-arm64/python3-proton-vpn-local-agent_${pkgver}_arm64.deb")

sha256sums_x86_64=('8ab54809637389639009b701b31d19c3fef411855657a7c85472ce0a642092f5')
sha256sums_aarch64=('96b74e7ecfd4f3fb72b5cd51205250c84a9f1ac29591861b21b64ca9c15a23fb')

prepare() {
	tar -xvf 'data.tar.xz' -C "${srcdir}"
}

package() {
	install -Dvm644 usr/lib/python3/dist-packages/proton/vpn/local_agent.abi3.so "${pkgdir}"/usr/lib/python3.12/site-packages/proton/vpn/local_agent.abi3.so
}
