#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.tar.xz.sig
)
sha512sums=(
  5150a70b2e03299450fe71ef2676b37d9375c537f5d49ee51b07d2c5016d14606b80fe8798bf4431e0780e250dabf01984446ae95f4b0f8eb4759897f50307ed
  30f83e5aa6be6a63a7e0452fc48b41d37b184c827fd34c6ee7080cd1f6c38df701563c08c11a10e5a4d3300412f22c306c2ec7531f2b4657f5c7588b9f7fc9e6
)
md5sums=(
  865ad8b703be3e6160936fe4f7c1c952
  71bc4adece893d437017f00524a990cb
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
