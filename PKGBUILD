#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2021
pkgrel=4
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/svgtools"
depends=(python3)
optdepends=('inkscape: required for ji2pdf and jessy_to_slides' 'parallel: GNU Parallel support for ji2pdf' 'phantomjs: required for jessy_to_slides' 'poppler: required for ji2pdf')
source=(
  https://xyne.dev/projects/svgtools/src/svgtools-2021.tar.xz
  https://xyne.dev/projects/svgtools/src/svgtools-2021.tar.xz.sig
)
sha512sums=(
  c50a8695a8dd9bcb8e7315a1bc408ae5a8fee0e2f89926d9d7609c253183f59bc0ac936184d5ba4b83e5843b6760e356bd2abbdb6815012ea97dc34a2fb220b6
  33902a6a6890a1790cc7829296e6e83e11c1227c1b22e3d2224e903d49a6c758fe4168cbdfdee882110b030eebc6bac15e9f89f84c87bc52886f2c918622b1ca
)
md5sums=(
  ef52f777f4a8c590c497de943710a3eb
  a46365f7b8113ba7b0614b8a386ccaeb
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for script_ in scripts/*
  do
    install -Dm755 "$script_" "$pkgdir/usr/bin/${script_##*/}"
  done
}


# vim: set ts=2 sw=2 et:
