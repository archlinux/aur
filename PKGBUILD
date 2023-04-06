pkgname=x-pixiv-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Pixiv downloader"
url="https://github.com/xiaoxigua-1/XPixiv"
license=("MIT")
arch=("x86_64")
provides=("x-pixiv")
conflicts=("x-pixiv")
source_x86_64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.0.1.6/x-pixiv-0.1.6-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.0.1.6/x-pixiv-0.1.6-aarch64-unknown-linux-gnu.tar.gz")

prepare() {
    git clone https://aur.archlinux.org/openssl-1.0.git $srcdir/openssl
    cd $srcdir/openssl
    makepkg -si
    cd ..
    rm -rf openssl
}

package() {
    install -Dm755 x-pixiv -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums_x86_64=('fb00aa4c230cbdd80d5302ece229c357d9de9a73482ef7df8c5bef50b9f2bc16')
