#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.12.5
pkgrel=1
pkgdesc='AUR-related modules and helper utilities (aurploader, aurquery, aurtomatic).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-aur"
depends=(pyalpm python-xdg python3 python3-xcpf)
optdepends=('curl: Aurploader support')
replaces=(aurploader)
conflicts=(aurploader)
provides=(aurploader)
source=(
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.5.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.5.tar.xz.sig
)
sha512sums=(
  35c11179fbd9cd29979124a704a1fae5627fae7e6ee41bae9d7b6ab6e73f0ab8120fb2d7f616c7c61255367c7c4340804fc8983005b89844b9eb953e54b0ba66
  210c8cba11d157eafd645eff54b98cc8f8fa38a3332a1ca4a8ffe5be69de706786c59fee7cee9a8e4e1bf0851fe29f2201d8a64dddce952e9a465d74915654b4
)
md5sums=(
  d16427da199fcc50a7bc7b56840c3b87
  33c7bdd6c56b93cd44a76e470337a18c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for aurfoo in aur*
  do
    if [[ -x $aurfoo ]]
    then
      install -Dm755 "$aurfoo" "$pkgdir/usr/bin/$aurfoo"
    fi
  done
}


# vim: set ts=2 sw=2 et:
