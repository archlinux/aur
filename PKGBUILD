# Maintainer: Stuart Cardall <developer__at__it-offshore.co.uk>
pkgname=arch-sign-modules
_pkgname=Arch-SKM
pkgver=0.7.5
pkgrel=1
pkgdesc="Signed (In Tree & Out of Tree) Kernel Modules for linux linux-lts linux-hardened linux-zen + AUR kernels"
arch=(any)
url="https://github.com/itoffshore/Arch-SKM"
license=(MIT)
depends=('git' 'rsync' 'python-zstandard')
optdepends=('pacman-contrib'
            'nano: default editor'
            'mousepad: default gui editor')
install="$pkgname.install"
source=($pkgname-$pkgver.tar.gz::https://github.com/itoffshore/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('7d0f453190ca8d5e45e7ae8eff2c1947')

package() {
  cd $_pkgname-$pkgver
  mkdir -p $pkgdir/usr/{src,bin,share/$pkgname}

  cp -rf certs-local $pkgdir/usr/src/
  cp scripts/* $pkgdir/usr/bin/
  cp Arch-Linux-PKGBUILD-example $pkgdir/usr/share/$pkgname/PKGBUILD.example
  cp -rf patches $pkgdir/usr/share/$pkgname/patches
  cp README.scripts.md $pkgdir/usr/share/$pkgname/README.scripts.md
  # license
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
