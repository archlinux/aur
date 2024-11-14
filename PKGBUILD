# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-local-agent-bin
pkgver=1.1.4
pkgrel=1
pkgdesc='A python module which implements a client for the Proton Local Agent API.'
arch=('x86_64' 'aarch64')
conflicts=('python-proton-vpn-local-agent')
provides=('local_agent.abi3.so')
url="https://github.com/ProtonVPN/local-agent-rs"
license=('GPL3')

source_x86_64=("https://repo.protonvpn.com/debian/dists/stable/main/binary-amd64/python3-proton-vpn-local-agent_${pkgver}_amd64.deb")
source_aarch64=("https://repo.protonvpn.com/debian/dists/stable/main/binary-arm64/python3-proton-vpn-local-agent_${pkgver}_arm64.deb")

sha256sums_x86_64=('ae43ef3251aeac35f495325a93dffef88ea34c743a5db4894b1e8bbd86fdffe0')
sha256sums_aarch64=('23641305c77a752964c3824cc0174fff249bdcf63ca1213b4325fb9482218273')

prepare() {
	tar -xvf 'data.tar.xz' -C "${srcdir}"
}

package() {
	install -Dvm644 usr/lib/python3/dist-packages/proton/vpn/local_agent.abi3.so "${pkgdir}"/usr/lib/python3.12/site-packages/proton/vpn/local_agent.abi3.so
}
