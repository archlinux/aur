# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=syncthingctl-bin
_pkgname=syncthingctl
pkgver=1.5.5
pkgrel=1
arch=('x86_64')
pkgdesc='CLI application for Syncthing without Syncthingtray - binary'
license=('GPL')
url="https://github.com/Martchus/syncthingtray"
provides=('syncthingctl')
conflicts=('syncthingctl')
source=("$url/releases/download/v$pkgver/syncthingctl-$pkgver-$arch-pc-linux-gnu.tar.xz"
        "https://raw.githubusercontent.com/Martchus/syncthingtray/master/LICENSE")
sha512sums=('1ec4e7c3e32bb6c2f5ffacaacd04fd6c254e34335c8fb42e237bd2fbc805fdd384920e869d735e39dfa98bd5ff16edfc8a12333971b2b15737c6e95589238568'
            '5aef077e354d83b47c06ec311a9fcfbabaa95bd1016084cacda7078f96c5f9f0f7db0204592890b5e12677e5a1ca7f87208e6879d09afce19dd353884f0ab042')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${srcdir}/syncthingctl-$pkgver-$arch-pc-linux-gnu" "${pkgdir}/opt/$pkgname/syncthingctl"
  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/$pkgname/syncthingctl "${pkgdir}/usr/bin"
}
