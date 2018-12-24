# Maintainer: Ariel AxionL <axionl@aosc.io>
pkgname=gcsf-bin
pkgver=0.1.19
pkgrel=1
pkgdesc="a FUSE file system based on Google Drive (Written by Rust)"
arch=('x86_64')
depends=('fuse2' 'openssl-1.0')
makedepends=('git' 'rust')
optdepends=("ranger: A simple, vim-like file manager")
conflicts=("gcsf-git" "gcsf")
provides=("gcsf")
url="https://github.com/harababurel/gcsf"
license=('MIT')
install="gcsf.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/harababurel/gcsf/releases/download/${pkgver}/gcsf-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
        "gcsf.install"
        "https://raw.githubusercontent.com/harababurel/gcsf/master/LICENSE")

sha256sums=('a2e920541ec14004088dfb11fbd8aa00677b89850eee1f38f3199bbfdbe91fc8'
            '379c996c9cf50bfffdd381d1f9f99695b1af5bab17b0ccd14006999d6e0351c1'
            'b0925ed614686ab9bfc429f9403e15db176949e0c6cb7473b6a2a8278f672d68')
package() {
	cd ${srcdir}
    install -Dm755 ./gcsf ${pkgdir}/usr/bin/gcsf
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim set: ts=4 sw=4 et
