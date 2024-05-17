#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2023
pkgrel=12
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/svgtools"
depends=(python3)
makedepends=(python-setuptools)
optdepends=('inkscape: required for ji2pdf and jessy_to_slides' 'parallel: GNU Parallel support for ji2pdf' 'phantomjs: required for jessy_to_slides' 'poppler: required for ji2pdf')
source=(
  https://xyne.dev/projects/svgtools/src/svgtools-2023.tar.xz
  https://xyne.dev/projects/svgtools/src/svgtools-2023.tar.xz.sig
)
sha512sums=(
  75c47ee820d54c0fc3b0212ee3a00d412ea5cc4f344cfc8d3b8abd76237138be7111304119f307111c0073e2cdcd4ed8c811e308051817436e88333babb95f30
  8578d68948b52a3fdf7a5813826289ba27ea2b899a4d97c75496dd5b646f8e839d621c44c75fcf02a259c2f0fcfd20db1f125145a5f628a21feb2259fc31e346
)
md5sums=(
  9886067d3fc23d3a7ae517fdd3f7e8e1
  2b18ed6639a4030d945f0b999d45fed1
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

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
