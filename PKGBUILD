#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2017.3.19
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: ji2pdf and jessy_to_slides support' 'phantomjs: jessy_to_slides support' 'poppler: ji2pdf support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.19.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2017.3.19.tar.xz.sig
)
sha512sums=(
  dfe473fbd7799fc05ed7e34804165569131f5505123281104cff5b9d26f38bc6b59e3c420c0f10d289cf85cd973c524a5032870f2c11690e8bf62555ed0ab048
  213304d3ad80cce06d76a5b8f860f93ff1a57ac03fb16021cc08d25b9f8399e47ae9d2a5427bc147dd4a1ef7fa98330a20c129c50b46c7c344d2fcbc01f1fd57
)
md5sums=(
  c23d8a617313ebff43df953582515797
  ce8dc03511c6afa55296b8da88d5f4ad
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
