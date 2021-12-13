#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2021
pkgrel=2
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
  a8fd4236cffdbad323e4255f6e0f43180b743fc73436187445dd4cb2b6afe35aef2c4d0113b847d1e549897d675fb7ec6a73eada4e6f2d1ec6eaf3914e45fa99
)
md5sums=(
  ef52f777f4a8c590c497de943710a3eb
  dfffbb938416e4ffc194f4f213f66873
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

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
