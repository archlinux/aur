# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=syncthingctl
pkgver=1.4.1
pkgrel=1
arch=('x86_64')
pkgdesc='CLI application for Syncthing without Syncthingtray - binary'
license=('GPL')
url="https://github.com/Martchus/syncthingtray"
source=("$url/releases/download/v$pkgver/syncthingctl-$pkgver-$arch-pc-linux-gnu.tar.xz"
        "https://raw.githubusercontent.com/Martchus/syncthingtray/master/LICENSE")
sha512sums=('c61b61d9642a5e90b61695116360afd41caf82ae2113dd8d195daa9b4bce912225ab28a7f2fbf8449aa26576110782ec33bb87ce44020ccb9ce867459e96837e'
            '5aef077e354d83b47c06ec311a9fcfbabaa95bd1016084cacda7078f96c5f9f0f7db0204592890b5e12677e5a1ca7f87208e6879d09afce19dd353884f0ab042')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install required binaries & scripts
  install -Dm755 "${srcdir}/syncthingctl-$pkgver-$arch-pc-linux-gnu" "${pkgdir}/opt/$pkgname/syncthingctl"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/$pkgname/syncthingctl "${pkgdir}/usr/bin"
}
