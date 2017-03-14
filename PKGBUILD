#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.3.14
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.14.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.14.tar.xz.sig
)
sha512sums=(
  eb4e8a03c169c743038b3f7f5556dad9b940c6fd611f450b7974ce2566845913fc7a33cde89ffef770d72ae9d75e90376eaeb173982b1899dad35a2726e00b03
  0595009574d0d0b95d621b2952ae617da4a46ea8844f1466c15526ee80d504baae23d635dd52421378ad7f413882c82db661f3d1375c7bb486f905e4c3129e19
)
md5sums=(
  8a869b2165a08af6862051c7d1cc2967
  27a5fa7425afff9638571e2b4ebbc5b3
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
