# Maintainer: lsaa <lsaadev dot personal at gmail dot com>

_pkgname=ddstats-rust
pkgname=${_pkgname}-bin
pkgver=4
pkgrel=4
depends=('openssl-1.0' 'libxau' 'libxdmcp')
source=("https://github.com/lsaa/ddstats-rust/releases/download/v0.6.10-181/ddstats-rust-linux-x86_64.zip")
arch=('x86_64')
sha256sums=('1656e6caf40dc95f6cdfad286a0f6246672d1feee38ded01955a58ad60e7cdae')
b2sums=('SKIP')

package() {
	cd ddstats-rust-linux
	install -Dm755 ddstats-rust "${pkgdir}/usr/bin/ddstats-rust"
	setcap cap_sys_ptrace=eip "${pkgdir}/usr/bin/ddstats-rust"
	install -Dm644 default_cfg.ron "${pkgdir}/usr/share/doc/${_pkgname}/default_cfg.ron"
}
