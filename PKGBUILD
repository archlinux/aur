# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=jrp-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='JSON formatter that lays out a document by the shape of the data'
arch=('x86_64' 'aarch64')
url='https://github.com/patrickbergner/json-really-pretty-cli'
license=('MIT')
provides=("jrp=$pkgver")
conflicts=('jrp')
# The release binaries are already stripped (-s -w); install them unchanged
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/jrp-$pkgver-linux-amd64.zip")
source_aarch64=("$url/releases/download/v$pkgver/jrp-$pkgver-linux-arm64.zip")
sha256sums_x86_64=('8bfb027055ac7cc955eba049b4c727c4dbf176523c3545cb93a379c381e6f961')
sha256sums_aarch64=('462e1fb66feba4d0d8c991d3615d08e3c33972ad167397185002739f8c7bee6f')

package() {
    cd "jrp-$pkgver"
    install -Dm755 jrp -t "$pkgdir/usr/bin"
    install -Dm644 readme.txt -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
