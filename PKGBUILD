#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.10.6
pkgrel=1
pkgdesc='AUR-related modules and helper utilities (aurploader, aurquery, aurtomatic).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-aur"
depends=(pyalpm python3 python-xdg python3-xcpf)
optdepends=('curl: Aurploader support')
replaces=(aurploader)
conflicts=(aurploader)
provides=(aurploader)
source=(
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.10.6.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.10.6.tar.xz.sig
)
sha512sums=(
  df94e588a5dedaf19b57219c1be7c70e1e601ecfee1fc77e72c0d8b734f7ff38db68595e9b0ebaf1e2533af524359dbc1944451e339bd4bc071392cace575137
  8b4095d005103057d80ef5e141a05c792cd9ef8bfd31eb4ebd347ac0ab48d924b0f05950e6f4d4c3c5af7213c8630c2b20876c19779b7795aa785414389d979c
)
md5sums=(
  a160d5297360c338c4672c5f81644fea
  1eb61c2e6a2e60e304eda080b08b10e4
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
