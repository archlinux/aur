# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=pit-bin
pkgver=2.10.0
pkgrel=1
pkgdesc='Work with a directory tree of several git repositories as if it were one'
arch=('x86_64' 'aarch64')
url='https://github.com/patrickbergner/pit'
license=('MIT')
depends=('git')
provides=("pit=$pkgver")
conflicts=('pit')
# The release binaries are already stripped (-s -w); install them unchanged
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/pit-$pkgver-linux-amd64.zip")
source_aarch64=("$url/releases/download/v$pkgver/pit-$pkgver-linux-arm64.zip")
sha256sums_x86_64=('96f93c17ad8a754c7b29ab876214eb664c5818285d1d842b0528c714f7f9987e')
sha256sums_aarch64=('85bb93d6bc8d93e9d8c63e77d613da57d970144ad0ea9125359c8d8748de1dcd')

package() {
    cd "pit-$pkgver"
    install -Dm755 pit -t "$pkgdir/usr/bin"
    install -Dm644 readme.txt -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
