#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2020
pkgrel=2
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2020.tar.xz
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2020.tar.xz.sig
)
sha512sums=(
  62ee997538d0b6935d31c63d37f2af212d0fb40823a2e952d57e1078aa2c3d72697afc6b26437f3b12959fcf222ad46e1d03d866bb1e98239b7dd1f0c4e970b4
  6307cdcc947c84468746860b70170124763c19be838d42d62f7c7c1eeacb5795f24d84dede573a47ea38d2f74eff13d0e70dec5ef3ef181c0781eb54f81a53c2
)
md5sums=(
  e6aa2e08483aa21c566b0f2a83ce1c29
  4d7d32d744ffd4879c1e6a87e9cba917
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
