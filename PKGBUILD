# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=wine-mono-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine')
provides=("${pkgname/-bin/}=$pkgver")
options=('!strip')
source=("https://github.com/madewokherd/wine-mono/releases/download/${pkgname/-bin/}-$pkgver/${pkgname/-bin/}-$pkgver-x86.tar.xz")
sha512sums=('64380288fc3a4fc324e15d8b864d995afe2bcb0c96ff02779b4f39c819a43d8e5e84162156ae011db7153a68f2a752c044149bec5804955822826622eb2cca5e')

package() {
  install -Dm 755 -d "$pkgdir"/usr/share/wine/mono/
  cp -dr --no-preserve='ownership' ${pkgname/-bin/}-$pkgver "$pkgdir"/usr/share/wine/mono/
}
