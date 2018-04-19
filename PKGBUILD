# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Liqueur Librazy <im@librazy.org>
# Contributor: Jian Zeng <anonymousknight96@gmail.com>
pkgname=tidb-bin
_basever=2.0.0
_rcver=6
pkgver=$_basever.rc$_rcver
pkgrel=1

pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflict=('tidb-bin-nightly')
options=(strip debug)
source=("https://download.pingcap.org/tidb-v$_basever-rc.$_rcver-linux-amd64.tar.gz")
sha256sums=('3ef3ebd6cfd9a4ae471fef37819b7ca1be3576b6041eddc190622ccaa6b61b8c')

package() {
    cd "tidb-v$_basever-rc.$_rcver-linux-amd64/bin" || exit 1
    for i in ti* pd-*; do
        install -Dm755 "$i" "$pkgdir/usr/bin/$i"
    done
}
