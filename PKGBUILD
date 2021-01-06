# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.13.1.3480
pkgrel=1
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Freeware')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'libtorrent')
source=("${pkgname}-${pkgver}-amd64.deb::http://debrepo.freedownloadmanager.org/pool/main/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=("460c3354d5fda7c07e936da4b282ac1a1a2cd5145207d425572a506cf8bece91")

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
