# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=syncthingctl-bin
_pkgname=syncthingctl
pkgver=1.6.3
pkgrel=1
arch=('x86_64')
pkgdesc='CLI application for Syncthing without Syncthingtray - binary'
license=('GPL-2.0-or-later')
url="https://github.com/Martchus/syncthingtray"
provides=('syncthingctl')
conflicts=('syncthingctl')
source=("$url/releases/download/v$pkgver/syncthingctl-$pkgver-$arch-pc-linux-gnu.tar.xz"
        "https://raw.githubusercontent.com/Martchus/syncthingtray/master/LICENSE")
sha512sums=('fd323fcbef10cdd17fad1b932aa222d95db2afac3190cd5b186d47b987b6ef4913fb994f1956da892795e1fce93990811682911a1e64adf37a1f4706d9092fa5'
            '5aef077e354d83b47c06ec311a9fcfbabaa95bd1016084cacda7078f96c5f9f0f7db0204592890b5e12677e5a1ca7f87208e6879d09afce19dd353884f0ab042')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${srcdir}/syncthingctl-$pkgver-$arch-pc-linux-gnu" "${pkgdir}/opt/$pkgname/syncthingctl"
  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/$pkgname/syncthingctl "${pkgdir}/usr/bin"
}
