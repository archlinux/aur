# Maintainer: Hugo Castilho <hugo.p.castilho@telecom.pt>
pkgname=meocloud-gui
pkgver=0.2.29beta
pkgrel=1
pkgdesc="Cloud storage service and file synchronization service"
arch=('x86_64')
url="https://meocloud.pt"
license=('custom')
options=('!strip' '!upx')


source=("https://meocloud.pt/binaries/linux/${arch}/${pkgname}-${pkgver}_${arch}.tar.gz"
        "TOS.txt")
sha256sums=('3cf1619a65b1b3e2ca4bce39b9a3ae504c4b53c105c4423e5a9419eba657a9d7'
            '240ca45ba26f1a9df5b277d9b51e2b53a152a9c20c74e6b965e4a60d965fce0f')


package() {
    cp -R $srcdir/{opt,usr} $pkgdir
    install -D -m 644 "$srcdir/TOS.txt" "$pkgdir/usr/share/licenses/$pkgname/TOS.txt"
}
