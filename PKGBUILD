# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=syncthingctl
pkgver=1.3.3
pkgrel=1
#arch=('i686' 'x86_64') # todo: add support for i686
arch=('x86_64')
pkgdesc='CLI application for Syncthing without Syncthingtray- binary'
license=('GPL')
url="https://github.com/Martchus/syncthingtray"
source=("$url/releases/download/v$pkgver/syncthingctl-$pkgver-$arch-pc-linux-gnu.tar.xz"
        "https://raw.githubusercontent.com/Martchus/syncthingtray/master/LICENSE")
sha512sums=('bccc8dc3725608969e96eef93733538e41feda9abff6b25289ddae0fd305d7f00c70e22594bbc06edc4f4aef0a8268dc24811b597081327867d78d1f63203ff5'
            '5aef077e354d83b47c06ec311a9fcfbabaa95bd1016084cacda7078f96c5f9f0f7db0204592890b5e12677e5a1ca7f87208e6879d09afce19dd353884f0ab042')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install required binaries & scripts
  install -Dm755 "${srcdir}/syncthingctl-$pkgver-$arch-pc-linux-gnu" "${pkgdir}/opt/$pkgname/syncthingctl"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/$pkgname/syncthingctl "${pkgdir}/usr/bin"
}
