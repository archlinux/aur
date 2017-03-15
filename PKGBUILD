#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.3.15
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.15.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.15.tar.xz.sig
)
sha512sums=(
  611a7c3a69498cc44c2d056f53f92b62aed00a1ab52ec866d142b7b17ecbc6afab7aff9baf45071274d47577c4e0e9658119d48d09d5faa30aca3df9fa919043
  de7ba440f8e17438d933c5971cbf0b99faff5a1f47c44ee1726b2c2a49c0902a5072ce879e37d66c628fb6d02436091333b6a482676d5f9f31e337d71dba8d55
)
md5sums=(
  25f90d35e38a35f9330edfc6472580ca
  b8b02683da67416042dc0382db091dfd
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
