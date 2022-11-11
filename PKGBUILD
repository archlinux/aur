# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=syncthingctl
pkgver=1.3.0
pkgrel=1
#arch=('i686' 'x86_64') # todo: add support for i686
arch=('x86_64')
pkgdesc='CLI application for Syncthing without Syncthingtray- binary'
license=('GPL')
url="https://github.com/Martchus/syncthingtray"
source=("$url/releases/download/v$pkgver/syncthingctl-$pkgver-$arch-pc-linux-gnu.tar.xz"
        "https://raw.githubusercontent.com/Martchus/syncthingtray/master/LICENSE")
sha512sums=('a14176d9c6592b059e9b30993f74de78f70507ad68b519d98d63bdaa3b92e0d9cd13e0fdd373188390247dee87d75393eaa26e56b16e02e43273507314a59e99'
            '5aef077e354d83b47c06ec311a9fcfbabaa95bd1016084cacda7078f96c5f9f0f7db0204592890b5e12677e5a1ca7f87208e6879d09afce19dd353884f0ab042')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install required binaries & scripts
  install -Dm755 "${srcdir}/syncthingctl-$pkgver-$arch-pc-linux-gnu" "${pkgdir}/opt/$pkgname/syncthingctl"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/$pkgname/syncthingctl "${pkgdir}/usr/bin"
}
