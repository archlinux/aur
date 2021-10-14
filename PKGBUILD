# Maintainer: App by Troye <guo362429@gmail.com>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=koodo-reader
pkgver=1.3.1
pkgrel=1
pkgdesc="A cross-platform ebook reader"
arch=('x86_64')
url="https://koodo.960960.xyz/"
license=('GNU Affero General Public License v3.0')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/troyeguo/koodo-reader/releases/download/v1.3.1/Koodo.Reader-$pkgver.deb")
sha256sums=("d1c9ff1dafd43b0d7a6a16bca83db50b64f2b010a99a9d2a4023694c606dd4d0")

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -xvf data.tar.xz -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    cp -dpr --no-preserve=ownership opt usr "$pkgdir"

    install -d "$pkgdir/usr/bin"
    ln -sv "/opt/$pkgname/koodo-reader" "$pkgdir/usr/bin/koodo-reader"
}
