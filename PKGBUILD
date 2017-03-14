#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.3.14.2
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.14.2.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.14.2.tar.xz.sig
)
sha512sums=(
  10a2be332f4aacf3abac5565f30355e00ce6330d0fac83f6eeeff306971b854e07cac6a4a06347db60b6e36e968556db8278f83deadf3057050e25f2ebfcb2b6
  c5155b83b5ba6b28fc24f2c1fe1e44781a542454ddbb5ee16af0b1fd4e679835f329c3f2b2c48c6140164e737f52b0d0621c52c34d1d084bdb7924dd433e8371
)
md5sums=(
  77eb5813f8666fc66a404b00b3aebb04
  290668a742c2accd1330376962218cfc
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
