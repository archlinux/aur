# Collaborator: Liqueur Librazy <im@librazy.org>
# Maintainer: Jian Zeng <anonymousknight96@gmail.com>
pkgname=tidb-bin
pkgver=1.0.5
pkgrel=1

pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflict=('tidb-bin-nightly')
source=("https://download.pingcap.org/tidb-v$pkgver-linux-amd64.tar.gz")

sha256sums=('3448548854d4f5e388a10a184e3de5cb9e76ec3323abc3a0e3fbe3cb7155d35a')

package() {
    cd "tidb-v$pkgver-linux-amd64/bin" || exit 1
    for i in ti* pd-*; do
        install -D -m755 "$i" "$pkgdir/usr/bin/$i"
    done
}
