#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2022
pkgrel=1
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
  56979899af063f5af3727f5d00f546d5b8eaed2a214dafdb86d5056567a0fa4272810e185cf44b52ca11067cebbacf5caf663e02f6f18f9227b427d7a82afe9c
)
md5sums=(
  065d4f2672d4b8f7db2ed2a48682b2c1
  e68959ac4eff7827c19d81ae77908338
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

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
