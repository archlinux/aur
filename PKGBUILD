#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.3.15.1
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.15.1.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.15.1.tar.xz.sig
)
sha512sums=(
  7a291dcded70c6d118633df698ba43250c38291e7521e9e3b528f8f5cd99fd9088f051611aa80bedc924ca37c87bb23a6f5a3d0c83451902cf8274a36fe373dd
  1df3e0a4217347d89aa045bc480849d83f0e62885d04a934a99b69c0af08f74061d456e0413efeeaac5cae987ca9221a54fc6350f3cdf982b212dbdadcf99c10
)
md5sums=(
  571250ed96302753f6b3fccc70cdcb96
  9f4fbd7bbfe0425f45c90372c4f03f51
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
