#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2019
pkgrel=2
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2019.tar.xz
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2019.tar.xz.sig
)
sha512sums=(
  eddcb0c16af8343df83554fe54407141053b44a27b72feed07108c399e61df2f1431e7ac7f9fbc0bbb5cd19865c65bacaa18a1a268040d2cb8eada6640590557
  4ac6d4b384e2787ab24d8f1d9086bd5276b57eafa60dba017957f075e902ce7a86b9ef72fd643707cd399b1bdf79c254b17a67ab3c16e354d2f32060cb8ec2a8
)
md5sums=(
  656e57cc6bdd18fa656c1a1f980c1e75
  93b741e4e19b1db83bb205f0948dac21
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
