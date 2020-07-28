#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2020.7.27
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: required for ji2pdf and jessy_to_slides' 'parallel: GNU Parallel support for ji2pdf' 'phantomjs: required for jessy_to_slides' 'poppler: required for ji2pdf')
source=(
  https://xyne.archlinux.ca/projects/svgtools/src/svgtools-2020.7.27.tar.xz
  https://xyne.archlinux.ca/projects/svgtools/src/svgtools-2020.7.27.tar.xz.sig
)
sha512sums=(
  e9eb3626e730619d01daac3d2bcce9256ddf6d98ad80f063f1ffcbdefb789b6f0c2530147048fef99abc5cf56008f2e225d76b6fd9250046f546ec9b20ab3f87
  3cf135d4c94a3ca982631e6f0fc37c8b3b3b3e0ba02fe1be9565f50ba25bd505c7750e572eda9045828de0028391cb71ea776cfd368a4b49f079caac6d8a5252
)
md5sums=(
  31b374ab378d81224fc60e6d5ecb3a99
  0ca56c4b2b0f001dff2a70b13dae7ac9
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
