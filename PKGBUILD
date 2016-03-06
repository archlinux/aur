# Maintainer: Philipp Klein <philipptheklein@gmail.com>
pkgname=gdrive
pkgver=2.0.1
pkgrel=1
pkgdesc="Command line utility for uploading and downloading single files to your Google Drive"
arch=('x86_64' 'i686')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
groups=()
depends=()
makedepends=("go")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/prasmussen/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e3cbd0d28669753c914af7c4832319d32586f6257bbd5f10d950bc4ed8322429')
noextract=()

build() {
    cd "$pkgname-$pkgver"

    go build
}

package() {
    cd "$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:sw=4:ts=4:et
