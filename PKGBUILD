#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2015.12
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3)
source=(
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2015.12.tar.xz
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2015.12.tar.xz.sig
)
sha512sums=(
  144816be331d37f66b00346a36443a8d537334a84c728d29979179328ea8475f734325b637ad6795c18ea128448b67e876b25f95b2a95a75a815b356ad5189a6
  88eda2107766a762df570b571f9ae7231cb8e71dc22d9a0e954ab7863dac38caf58ee7fd8d095454791171c4f431ed6b364e74fba711cebce255f90f7db8826a
)
md5sums=(
  3295d5960fc623c226d6760560084507
  9045fee9a7359896bf77ce7e672bc744
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver/src"
  for pkg in pkg-*
  do
    name="${pkg##*/}"
    install -Dm755 "$name" "$pkgdir/usr/bin/$name"
  done
}

# vim: set ts=2 sw=2 et:
