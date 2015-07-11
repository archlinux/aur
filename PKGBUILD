#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.7
pkgrel=1
pkgdesc='AUR-related modules and helper utilities (aurploader, aurquery, aurtomatic).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-aur"
depends=(python3 python-xdg)
optdepends=('curl: Aurploader support')
replaces=(aurploader)
conflicts=(aurploader)
provides=(aurploader)
source=(
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.7.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.7.tar.xz.sig
)
sha512sums=(
  0641b98cdd06cf9bc28a329d31c8870928319e3228c82ca116c7dc7fad173b08cb7a559fbe774128f85aad053e3cffd9cc96f50d98cbbfcfea8cb61615810f9d
  aa38d0a852c513cd60f8f9de0d325e1da625b6b0c4e1ae43eda50faedb3d162c7d607b7a041fd4f579b82021a7b5ec471ab30da8a312f6bfdf30776c73ff2702
)
md5sums=(
  269a3a0d2bc8e3634e50ee86167ee56c
  a5fd84b66ff070a1b1c8e96a9a2fd21f
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for aurfoo in aur*
  do
    if [[ -x "$aurfoo" ]]
    then
      install -Dm755 "$aurfoo" "$pkgdir/usr/bin/$aurfoo"
    fi
  done
}


# vim: set ts=2 sw=2 et:
