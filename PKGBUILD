#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.12.5.2
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
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.5.2.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.5.2.tar.xz.sig
)
sha512sums=(
  0121252901b65bfa12130e1e04d888d580c5e51e846eab77b3d1520f9ecd2f3f93de3a408591e4e05186592472c5efeb9c0baf9facb615dbea9daea711ae59f0
  dc64af66d45bc46602b41f9dded1e40731c62a7632a60ec3f039e0becb49113bc9e8e0a86f34e790e1e8742c52895e283df5da5c5b6dbaaa4841b4965d75ef96
)
md5sums=(
  218a3777f10e5225ecb8245be6d7f6ce
  5e887b7ba7abc44a2b9501dc4243e0d1
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
