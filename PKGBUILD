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
#   download:      https://asger.weirsoe.dk/tarballz/ubl-tools-0.2.0-8b5ec2a43cf5-x86_64.tar.zst

pkgname=ubl-tools-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Read UBL e-invoices (Peppol BIS 3.0, OIOUBL) offline, in the terminal or as a printable page (prebuilt binary)"
arch=('x86_64')
url="https://gitea.weircon.dk/agw/ubl-tools"
license=('MIT OR Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=("ubl-tools=$pkgver")
conflicts=('ubl-tools')
options=('!strip' '!debug')
source=("https://asger.weirsoe.dk/tarballz/ubl-tools-0.2.0-8b5ec2a43cf5-x86_64.tar.zst")
sha256sums=('8b5ec2a43cf5921a5c0da8d317cc551ed5fd500b1fc80ac2925a6b26fd04a969')

package() {
    # The tarball is a staged tree: usr/ at its root.
    cp -a "$srcdir/usr" "$pkgdir/"
}
