pkgname=wine-stable-mono
_pkgname=wine-mono
pkgver=7.4.1
pkgrel=1
pkgdesc='Wine’s built-in replacement for Microsoft’s .NET Framework (for wine-stable)'
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
conflicts=('wine-mono')
provides=("wine-mono=$pkgver")
source=("https://github.com/madewokherd/wine-mono/releases/download/wine-mono-$pkgver/wine-mono-$pkgver-x86.tar.xz")
b2sums=('28adbcca630698e74e455fbe37b8cd60c3d836c503db6a2df20e4db3e12f549a5d1fae6a4c0ccd6068e2667f700fbfe09858b95f156ad8d660ef3804773179a0')

package() {
  install -d -m755 "$pkgdir"/usr/share/wine/mono/
  # Fake the file system version so Wine 8.0 is happy
  cp -r -a --no-preserve='ownership' $_pkgname-$pkgver "$pkgdir"/usr/share/wine/mono/$_pkgname-7.4.0
}
