#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2020
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  https://xyne.archlinux.ca/projects/svgtools/src/svgtools-2020.tar.xz
  https://xyne.archlinux.ca/projects/svgtools/src/svgtools-2020.tar.xz.sig
)
sha512sums=(
  8eff2d1549e12299f619f21c627da16b25014df628d59b1ccd63a57330613475ab52744f8d3b3191ea6c66a9cbf243186806ec00d7d22b2b5da0b1e2f3a6eb9d
  a99bf052b54c8d04b800751d5c690c288e83a2563336f1356c3fba7d045e3f07991d5dedcf9ad28776db30a82304710170b34f1d8d1f71bbe8d667f263e9bf07
)
md5sums=(
  68239853c1cac6b8eac5bc0dd15203db
  52a0a42c7b3637d58555646db6747912
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
