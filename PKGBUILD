# Collaborator: Liqueur Librazy <im@librazy.org>
# Maintainer: Jian Zeng <anonymousknight96@gmail.com>
pkgname=tidb-bin
pkgver=1.0.8
pkgrel=1

pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflict=('tidb-bin-nightly')
source=("https://download.pingcap.org/tidb-v$pkgver-linux-amd64.tar.gz")
sha256sums=('09846174db2c16421000e89e60e1e64a50613a0a11708abffb69f93f11a6f711')

package() {
    cd "tidb-v$pkgver-linux-amd64/bin" || exit 1
    for i in ti* pd-*; do
        install -D -m755 "$i" "$pkgdir/usr/bin/$i"
    done
}
