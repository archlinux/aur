#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2022
pkgrel=3
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
optdepends=('python3-colorsysplus: colorized output in some scripts')
source=(
  https://xyne.dev/projects/pkg_scripts/src/pkg_scripts-2022.tar.xz
  https://xyne.dev/projects/pkg_scripts/src/pkg_scripts-2022.tar.xz.sig
)
sha512sums=(
  e80b42e8beccdf3dfaa8dcb731c7571a6841f9a9741ee7e2b041b056fb61f10867eed6a64e6d3c621cb2e58ee76ab67260506fa37dd0b95f915f826e347dd488
  d51d648de0abc7fa746e533957f9d51f0dd7b1bc851f9249518f2e6a4279ba9050fed3683c112e0f1af843be26b392b2fa94fce52db8e74161ed73bf69eaaacd
)
md5sums=(
  065d4f2672d4b8f7db2ed2a48682b2c1
  e86bd2c33c36858b01aea842b3962817
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver/src"
  for pkg in pkg-* db-*
  do
    name="${pkg##*/}"
    install -Dm755 "$name" "$pkgdir/usr/bin/$name"
  done
}

# vim: set ts=2 sw=2 et:
