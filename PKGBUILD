#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.12.6.1
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
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.6.1.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.6.1.tar.xz.sig
)
sha512sums=(
  a0a3f1e1c321568423a0004023ca916547660745847a3e939ab51713fd6d86bf51f2cb11b3c1ca0b1c5093b6ee12f1b124d59cc327db9c980b4678c0ba763b75
  1e53ac33c70ee996cac63828354af7a25179ae897222190476d24668bff2844c6f6d9e2b04dbce709d3ee2c3795566df95daf6c73451696c884f8a7d2ad99476
)
md5sums=(
  85c4a579f34c2b1f0f36edcd546c66ce
  89e4e302c31e01513e78841163148320
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
