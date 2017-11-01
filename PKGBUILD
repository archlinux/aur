#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2017.11
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
optdepends=('python3-colorsysplus: colorized output in some scripts')
source=(
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2017.11.tar.xz
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2017.11.tar.xz.sig
)
sha512sums=(
  ad65555e308098ff49dd5d060d89afbf6c509f865a0cd143501a5e2824ba9df85c7d7987f6662b043f902de46aae65eee1f73bfdf08fd398d7452b308b748d12
  622811a262055719b98e5e4a7f7af533bb9018b8ed28a7f59bc95848958c3a464d550ddd78c1e2cf339cc1c81e00330747f6f5566584b0c58468153d8c3b7a63
)
md5sums=(
  491dbb7143f27369da17f5d1f870bd9e
  80fc4dff58fc9a5caf93d2e466b5e4a6
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver/src"
  for pkg in pkg-* db-*
  do
    name="${pkg##*/}"
    install -Dm755 "$name" "$pkgdir/usr/bin/$name"
  done
}

# vim: set ts=2 sw=2 et:
