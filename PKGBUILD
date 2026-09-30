# Maintainer: Asger Geel Weirsoe <asger at weircon dot dk>
#
# ubl-tools-bin: the same release as ubl-tools, prebuilt.
#
# PROVENANCE OF THE BINARY
#
# Built by the ubl-tools release workflow from the tagged source, in an
# archlinux:base-devel container, with `cargo build --release --locked`.
#
#   build recipe:  https://gitea.weircon.dk/agw/ubl-tools
#   download:      https://asger.weirsoe.dk/tarballz/ubl-tools-0.1.0-98f93f63c985-x86_64.tar.zst

pkgname=ubl-tools-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Read UBL e-invoices (Peppol BIS 3.0, OIOUBL) offline, in the terminal or as a printable page (prebuilt binary)"
arch=('x86_64')
url="https://gitea.weircon.dk/agw/ubl-tools"
license=('MIT OR Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=("ubl-tools=$pkgver")
conflicts=('ubl-tools')
options=('!strip' '!debug')
source=("https://asger.weirsoe.dk/tarballz/ubl-tools-0.1.0-98f93f63c985-x86_64.tar.zst")
sha256sums=('98f93f63c98569b235f9d70e04978d3ab0123bbe513c230e043f29166bda2044')

package() {
    # The tarball is a staged tree: usr/ at its root.
    cp -a "$srcdir/usr" "$pkgdir/"
}
