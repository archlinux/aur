#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2021
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
optdepends=('python3-colorsysplus: colorized output in some scripts')
source=(
  https://xyne.dev/projects/pkg_scripts/src/pkg_scripts-2021.tar.xz
  https://xyne.dev/projects/pkg_scripts/src/pkg_scripts-2021.tar.xz.sig
)
sha512sums=(
  bdfa10babf29f4749a393410325d07eaeb0c23d7b191387b5485160bee8a7dccfcba516f664c3405db642b6ef670ac281ffd0af66063e64e0809da58ea509b6f
  f3c6b85d5bcf6d5e9f268c276029d567c23758e77348a8870ddae97b02e60032588870f42d6484fd6c56d3f6b18336b34f98eb1e23c6f7e0969f2411f169f465
)
md5sums=(
  84ca8be5fc3ba18bfe2dd30a6167b241
  60de7026ad661d4b48c5e3464a0bd0d0
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
