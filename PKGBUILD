#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.3.11
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.11.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.11.tar.xz.sig
)
sha512sums=(
  060e94e3262cb0d31b96d5a0f458e4c737b0b7de2f00ae7ab080e2bb47f7b7b692fc32fcda230096298c8be78be3d8e45e66ca359e975708caaafc55a2929903
  2dd489cd0a24c79ed9cfe9df858b7db2ef399fa1045e96e126762b3bdaaae69fc3261daccf962cb320691566fc5f88aa1efb3bad3b173d73b41c6e117c0f4979
)
md5sums=(
  3e95c90a63481bea411e6445e9b3ba54
  9674c91e642fb87b970ae065622f940a
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
