# Maintainer: lsaa <lsaadev dot personal at gmail dot com>

_pkgname=ddstats-rust
pkgname=${_pkgname}-bin
pkgver=3
pkgrel=1
source=("https://github.com/lsaa/ddstats-rust/releases/download/v0.6.10-180/ddstats-rust-linux-x86_64.zip")
arch=('x86_64')
sha256sums=('SKIP')
b2sums=('SKIP')

package() {
	cd ddstats-rust-linux
	setcap cap_sys_ptrace=eip ddstats-rust
	install -Dm755 ddstats-rust "${pkgdir}/usr/bin/ddstats-rust"
	install -Dm644 default_cfg.ron "${pkgdir}/usr/share/doc/${_pkgname}/default_cfg.ron"
}
