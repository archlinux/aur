# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=wine-mono-bin
pkgver=4.9.4
pkgrel=2
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine')
provides=("wine-mono=$pkgver")
conflicts=("wine-mono=$pkgver")
options=('!strip')
source=("https://github.com/madewokherd/wine-mono/releases/download/${pkgname/-bin/}-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('52dfacacb65bbf1fa977e56ff62145d2919405c6d9bcf86091dd0a4e98cb30269ba625d01483abd3770d4daf9d0b27a58e7d27c64f04dd0d95a509c04b1a18d1')

package() {
  install -Dm 755 -d "$pkgdir"/usr/share/wine/mono/
  mv ${pkgname/-bin/}-$pkgver "$pkgdir"/usr/share/wine/mono/
}
