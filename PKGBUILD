# Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=kubesolo-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Single-node Kubernetes with the clustering machinery removed (binary package)"
arch=('x86_64')
url="https://github.com/portainer/kubesolo"
license=('MIT')
depends=(glibc)
conflicts=(kubesolo)
options=(!lto !debug)
source=("$url/releases/download/v${pkgver}/kubesolo-v${pkgver}-linux-amd64.tar.gz"
        "kubesolo.service"
        "kubesolo.env"
        "kubesolo-tmpfiles.conf")

b2sums=('06b60aa1054a7c7c88f47e4a71dc2eaf8980fe2824ea0a5a60ac7ec129b68c2c8fae8c406d41e59474eb6171727e8639afccbbe15aa85219024b091ed8c665b8'
        '8ce2722e9531e46d7b43ee2cf048922481cc08fb6ae588dab064db6fc6f7d209fa6a0cc68ec6217a130d12c8f99ad8dd44249d617362316aaae1327787b4fa3c'
        'cfc7ed43ee592fee01698b1693763abae73fe6d34318d24aca2e4998b8513ec6bff914a47c0cf86da8c08b7cb26b81cb3aa1e240b61734206d8dbdcb708c7034'
        'acf7394e461b245b22d7d339d3c6e016b5c92a226adbdfb390c0c2a7f33ccf5c840aefeeb1af740ea9375fa3db50ddd43fb3f6be469f36ba4571d2b28d1ecfbb')

package() {
    install -Dm755 kubesolo "$pkgdir/usr/bin/kubesolo"
    install -Dm644 kubesolo.service "$pkgdir/usr/lib/systemd/system/kubesolo.service"
    install -Dm644 kubesolo.env "$pkgdir/etc/default/kubesolo"
    install -Dm644 kubesolo-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kubesolo.conf"
}
