# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=pit-bin
pkgver=2.12.0
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
sha256sums_x86_64=('5af4b6c6e83cb7ac7b0c0cf915f297e79d7c3a3a8a9c8d723327f478f8ce35f3')
sha256sums_aarch64=('b7995f2509f5025b1653decffc0fd8ce03b8ce45c43fe9274b92a35827eaebca')

package() {
    cd "pit-$pkgver"
    install -Dm755 pit -t "$pkgdir/usr/bin"
    install -Dm644 readme.txt -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
