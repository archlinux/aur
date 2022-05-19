# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.16.2.4586
pkgrel=1
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Freeware')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'libtorrent')
# source=("${pkgname}-${pkgver}-amd64.deb::http://debrepo.freedownloadmanager.org/pool/main/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
source=("https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
sha256sums=("0cd81531fe3927e61e8c9f5da7b8f95900ada2e71240281280614af19815a92f")

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -xvf data.tar.xz -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    cp -dpr --no-preserve=ownership opt usr "$pkgdir"

    install -d "$pkgdir/usr/bin"
    ln -sv "/opt/$pkgname/fdm" "$pkgdir/usr/bin/fdm"
}
