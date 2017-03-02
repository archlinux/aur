#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.3
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.tar.xz.sig
)
sha512sums=(
  af8cd6bff5c653fe1fef1ece705102ea090a73bfa15015f25e57816501f37e9cea4bdeb16701b02e6c2d90977bb5a679967b5abfc18b35502b617e3b4753c96f
  450e39ea7294d848816581816c16eb97ff16d3c76735a3017f58d4d4e93a7ab47cde51b93203f14a994780be7a18aabee427b7ce799def4a695e379170aff82d
)
md5sums=(
  b6ca0c506860d3fd2693db53456bb71f
  6076ac5764b12128049274be5d5ae907
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
