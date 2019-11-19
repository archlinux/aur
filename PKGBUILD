#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.9
pkgrel=4
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  https://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.9.tar.xz
  https://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.9.tar.xz.sig
)
sha512sums=(
  385ccd4554e3c4fccc9f0eca43359d1567ea08c85f610f05184820599243e9e818cebf29b45ef60dff65fd2fc5d4cf64eeb79ddd67e6a0ea71a0ca1504128bf4
  5b68dfeaaf5252ab82c0ef48ed9b6ff49fbbc76648fcd53b9891f8bee4c92006a44939989cb4893c318014018a97a1bc29c5b8830dff1eecb5c266865547a63f
)
md5sums=(
  0e55e7827785fe27f0e1678bb7f4bbe5
  eb3e301629b8893af8b73a06b1710d4c
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
