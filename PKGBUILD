# Maintainer:  Tony Fettes <tonyfettes@tonyfettes.tk>

pkgname=tunasync-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA"
arch=('x86_64')
url="https://github.com/tuna/tunasync/releases"
license=('GPL')
options=('!emptydirs' '!strip' '!docs')
provides=('tunasync' 'tunasynctl')
conflicts=('tunasync-git' 'tunasync')
source=("tunasync-bin.tar.gz::https://github.com/tuna/tunasync/releases/download/v${pkgver}/tunasync-linux-bin.tar.gz")
md5sums=('55cdf1edaa080fab66c097f5bf10d2a0')

package() {
  printf '  Preparing the environment...\n'
  if [ ! -d "${pkgdir}/etc/" ]; then
    mkdir "${pkgdir}/etc/"
  fi
  if [ ! -d "${pkgdir}/etc/tunasync/" ]; then
    mkdir "${pkgdir}/etc/tunasync/"
  fi
  if [ ! -d "${pkgdir}/usr/" ]; then
    mkdir "${pkgdir}/usr/"
  fi
  if [ ! -d "${pkgdir}/usr/bin/" ]; then
    mkdir "${pkgdir}/usr/bin/"
  fi
  printf '  Extracting the tar.gz...\n'
  bsdtar -xzf tunasync-bin.tar.gz -C "${pkgdir}/usr/bin/"
}
