# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=syncthingctl
pkgver=1.4.13
pkgrel=1
arch=('x86_64')
pkgdesc='CLI application for Syncthing without Syncthingtray - binary'
license=('GPL')
url="https://github.com/Martchus/syncthingtray"
provides=('syncthingctl')
source=("$url/releases/download/v$pkgver/syncthingctl-$pkgver-$arch-pc-linux-gnu.tar.xz"
        "https://raw.githubusercontent.com/Martchus/syncthingtray/master/LICENSE")
sha512sums=('8ab3ff383ae7737dd8ed3e6eaa4a3f18f03c28e2244bcc2e0fe7e7b9d8b5f5950cef4a56f91ef55a97d61e909f16ebe1fa3ba9b6dd023423bb0745a8921fb68e'
            '5aef077e354d83b47c06ec311a9fcfbabaa95bd1016084cacda7078f96c5f9f0f7db0204592890b5e12677e5a1ca7f87208e6879d09afce19dd353884f0ab042')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install required binaries & scripts
  install -Dm755 "${srcdir}/syncthingctl-$pkgver-$arch-pc-linux-gnu" "${pkgdir}/opt/$pkgname/syncthingctl"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/$pkgname/syncthingctl "${pkgdir}/usr/bin"
}
