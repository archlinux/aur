# Maintainer: lsaa <lsaadev dot personal at gmail dot com>

_pkgname=ddstats-rust
pkgname=${_pkgname}-bin
pkgver=1
pkgrel=1
source=("https://github.com/lsaa/ddstats-rust/releases/download/v1/ddstats-rust-v1-linux.zip")
arch=('x86_64')
sha256sums=('SKIP')
b2sums=('SKIP')

package() {
	install -Dm755 ddstats-rust "${pkgdir}/usr/bin/ddstats-rust"
	setcap cap_sys_ptrace=eip "${pkgdir}/usr/bin/ddstats-rust"
	install -Dm644 default_cfg.ron "${pkgdir}/usr/share/doc/${_pkgname}/default_cfg.ron"
}
