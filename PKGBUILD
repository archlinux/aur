pkgname=zxfer
pkgver=1.1.7
pkgrel=1
pkgdesc="transfer ZFS filesystems, snapshots, properties, files and directories"
arch=('any')
url="https://github.com/allanjude/zxfer"
license=('BSD')
depends=('zfs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/allanjude/zxfer/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir/zxfer-${pkgver}"

    mkdir -p "$pkgdir/usr/share/man/man8/"
    gzip -9 zxfer.8

    install -D -m755 "zxfer" "$pkgdir/usr/bin/zxfer"
    install -D -m644 "zxfer.8.gz" "$pkgdir/usr/share/man/man8/zxfer.8.gz"
    install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/zxfer/COPYING"
    install -D -m644 "CHANGELOG.txt" "$pkgdir/usr/share/doc/zxfer/CHANGELOG.txt"
}
md5sums=('8bca98fec809d041af6cac35eb40780d')
sha1sums=('f0c6954419d97bd82959f9efce674c377a78a1d9')
sha256sums=('c95ed822748806e93b06902575cfbaf99b6a236d21a6bb6c0e3d4648f2d48f29')
