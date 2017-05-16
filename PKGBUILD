#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2017.5
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2017.5.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2017.5.tar.xz.sig
)
sha512sums=(
  676d09c8c8b4df0323bbe8e01c26cf5c1052f59c9005e5dd54def3ab0fa6cdfe6aa545632fd1d3eb0e3e8508747c33ec8c3c1f98a7a4f4d660307f5379f9cc00
  115371dd5e96d640d3eb037fbd3eeed0200230060e9363024eaa4003ea103abd74fb49eac90b37cea8d3af1bbbaa143edda88f2e0255835a6e78cbedac21e5d9
)
md5sums=(
  9ad79e5a2498e7a6e8e851150589c8fc
  cfeccc2948edf7db5d6f17c081d63843
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
