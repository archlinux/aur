#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.3.20.1
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.20.1.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.20.1.tar.xz.sig
)
sha512sums=(
  baabb10b830917da69ab1518b5bec2ec382bf7a3948d2885aac5fa2b76810444239a3e17e11ba8446f816e1c11e40dce727bc1c1b9b1c5579352550a74f93d17
  c967da821ea5a5753385068b0732953f1d1bbf36e089dd5c07429008d4622256704413cb008d3bceebf84783315f8493a54c96e5ef64054c980f0c91e2d23cc2
)
md5sums=(
  cbe25ffda16da6cc1e1db55a694c1fa5
  d4f5626d3bd9c82a0d8a24ee8c7de404
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
