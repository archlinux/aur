# Maintainer: App by Troye <guo362429@gmail.com>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=koodo-reader
pkgver=1.3.4
pkgrel=1
pkgdesc="A cross-platform ebook reader"
arch=('x86_64')
url="https://koodo.960960.xyz/"
license=('GNU Affero General Public License v3.0')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/troyeguo/koodo-reader/releases/download/v1.3.1/Koodo.Reader-$pkgver.deb")
sha256sums=("f380aa60b5a21e1d1e1ff2502a98f307d68f1398cf79a48793b2ff1d044edffa")

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
