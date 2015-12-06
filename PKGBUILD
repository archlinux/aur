#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.12.6.4
pkgrel=1
pkgdesc='AUR-related modules and helper utilities (aurploader, aurquery, aurtomatic).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-aur"
depends=(pyalpm python-xdg python3 python3-xcgf python3-xcpf)
optdepends=('curl: Aurploader support')
replaces=(aurploader)
conflicts=(aurploader)
provides=(aurploader)
source=(
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.6.4.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.6.4.tar.xz.sig
)
sha512sums=(
  0e243149e34af0685a8affeed3e58e2b7145f78f10065290c3ec325713346f38dd69076491a7d44cfec0abfc239c09f453a0e18633fd0abd001678f8e342d4f7
  fdc32f6fba7e441205e5336280d47f5c7b22453df60be3cd472f085359bc40e287a5dfd0a5d1f6dc0059b1743355a62ff4765cdf3928728f965e2d3c67afa2e9
)
md5sums=(
  a6111fad791d98e4b12e1f352578eba7
  e20f757301026d646fb8a7e47b0c08b5
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
