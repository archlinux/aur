#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.12.5.1
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
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.5.1.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.5.1.tar.xz.sig
)
sha512sums=(
  6401d59f67231f8c620dbf9dc37aca671b2b34df7b659f7dd3205b7f85b5ee42c79b62c70b926534bc01a3dafdee80a9e52bf4cf08562b301d473ed86fdefb6f
  5a86af78c4a756c68a4ceb2c46b9dd9fc9e8200c758fc0d062e0326011e41cd0f1c362151e07347f40320fe95ecaeb7adcbe968e161b4816dceb48c0699e1dce
)
md5sums=(
  969523bde262d85445fd83a1b1067969
  343cd6b7a603286ecd1e1b2f7c32e544
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
