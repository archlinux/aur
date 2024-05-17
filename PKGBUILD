#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-nist
pkgver=2021
pkgrel=15
pkgdesc='Modules for accessing and working with data from the National Institute of Standards and Technology (NIST).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-nist"
depends=(python-pyxdg python3 python3-scinum)
makedepends=(python-setuptools)
optdepends=('python3-tabulator: support for command-line query scripts')
source=(
  https://xyne.dev/projects/python3-nist/src/python3-nist-2021.tar.xz
  https://xyne.dev/projects/python3-nist/src/python3-nist-2021.tar.xz.sig
)
sha512sums=(
  fc242f538979e50ed41e03b440eb9016cf8ad80aa0efde190593a838ad97b44b9d5fd0c333418b221c9b63a5a6dcf9c3c4d69f43f7c04707014500d49220e2b9
  cb6490e1c1cdc8a55cbff86f98939e9b0be4c52dd603b7ab508a9ea6543743bf901b65de980420197c81b8875347b83d1602080bfd6482c236f5475a44178115
)
md5sums=(
  df0937f9e05241eb86b629f89d4be920
  404ebf62045601becadf3e258f30078a
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for script_ in nist-*
  do
    install -Dm755 $script_ "$pkgdir"/usr/bin/$script_
  done
}


# vim: set ts=2 sw=2 et:
