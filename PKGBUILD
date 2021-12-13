#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-nist
pkgver=2021
pkgrel=2
pkgdesc='Modules for accessing and working with data from the National Institute of Standards and Technology (NIST).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-nist"
depends=(python-pyxdg python3 python3-scinum)
optdepends=('python3-tabulator: support for command-line query scripts')
source=(
  https://xyne.dev/projects/python3-nist/src/python3-nist-2021.tar.xz
  https://xyne.dev/projects/python3-nist/src/python3-nist-2021.tar.xz.sig
)
sha512sums=(
  fc242f538979e50ed41e03b440eb9016cf8ad80aa0efde190593a838ad97b44b9d5fd0c333418b221c9b63a5a6dcf9c3c4d69f43f7c04707014500d49220e2b9
  9c0a153557cad454945385803269c68439f6345fa855dc1175ba615e0dd6ac63bff3f2a17821d56208698e5c3360957f6fbf854bf43dc0a2312c147ce14960c3
)
md5sums=(
  df0937f9e05241eb86b629f89d4be920
  79ab9a544792882c13f832c1d268b9d6
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

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
