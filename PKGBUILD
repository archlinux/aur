#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2016.9.26.1
pkgrel=3
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2016.9.26.1.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2016.9.26.1.tar.xz.sig
)
sha512sums=(
  3ea47b7fda168c7781b920941c1293250948babbee6a673750e068272fe4d785626348d163101e4e8b69b53eef86bca2015a4564d590cd8a79cd702ac90794df
  914d6e85160d6f997c695c4ef9b526c64dbf57d6fbf6e56d654ec616da8ad2feb5cfa962df62139a66daf924c259233232507847c5c5772ed87416effff6d57b
)
md5sums=(
  0dbe677b334ca7f429611c6ba14949ab
  d3b92c11a53c690019885fbfa136d5cb
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
