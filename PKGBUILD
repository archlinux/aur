#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2016.2.1
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
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2016.2.1.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2016.2.1.tar.xz.sig
)
sha512sums=(
  021e5e322b5e7ad677160531efde6ddcd5ee7d57b63beccd4b67578507c6793b4da5a3e2641a9237645ff28020994d7a21d4cc4ec17010d328a7211b21396f82
  86de94282fa73409419b8df6c3cc02e66a7c7d2848c2672841dbd9ac0bff711760b02f529baa525d1ded1257966a107498387774a7875ea6d9af96cd87a72cba
)
md5sums=(
  5bd45c29ffb9767087ca79b59262939c
  23e107c4cefa7623b203a2d20fb042a8
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
