#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2016.9.26
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2016.9.26.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2016.9.26.tar.xz.sig
)
sha512sums=(
  f584950cd33ce30af6a0b89d1862d1048410e4ac9431eab3daa21251236e5a54e531b9b0650e40b44e3eb00b92774db057d321da166d0de23c5819a42bf18efd
  14198af994369bee33912ad33272fb0c642d0c2028c43cd64b072a0b87046d993cabb21329fd60fd06507bca602a5983846d7398103b4c25927072d96a0ccc89
)
md5sums=(
  ea801bb9710b4370485f34a49a662981
  148151ce9313e7a3fb0bf446f8d09040
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
