# Maintainer: Hugo Castilho <hugo.p.castilho@telecom.pt>
pkgname=meocloud-cli
pkgver=0.2.29beta
pkgrel=1
pkgdesc="Cloud storage service and file synchronization service, command line"
arch=('x86_64')
url="https://meocloud.pt"
license=('custom')
options=('!strip')


source=("https://meocloud.pt/binaries/linux/${arch}/meocloud-${pkgver}_${arch}.tar.gz"
        "TOS.txt")
sha256sums=('577236de621f5bab7325bc8e89fcc895a8452a3bf1a4e1bc6353cc36cb46c9e0'
            '240ca45ba26f1a9df5b277d9b51e2b53a152a9c20c74e6b965e4a60d965fce0f')


package() {
    cp -R $srcdir/{opt,usr} $pkgdir
    install -D -m 644 "$srcdir/TOS.txt" "$pkgdir/usr/share/licenses/$pkgname/TOS.txt"
}
