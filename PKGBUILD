# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=leetcode-cli
pkgname=leetcode-local-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Download leetcode problems to text files via the command line"
arch=("x86_64")
url="https://github.com/pramanandasarkar02/$_projectname"
license=("MIT")
makedepends=("go")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("270717ba04793437a01a79f8b2510328b2c7dd0eca3ff76706019f9bd229eb25c2d1f2e4b8ebc649a1225ed96137ae2e54cdb3728d7f4e7dc28f4f4a268bb5e6")

build() {
    cd "$_projectname-$pkgver"
    go build -o lc-cli
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 lc-cli "${pkgdir}/usr/bin/lc-cli"
    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
