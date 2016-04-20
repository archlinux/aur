#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2016.4
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
optdepends=('python3-colorsysplus: colorized output in some scripts')
source=(
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2016.4.tar.xz
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2016.4.tar.xz.sig
)
sha512sums=(
  0aecb3cf2539e67c0f5ba0fe409cbba78f7579e6f1941c86581ba4e163c88eb9f30eddeb249664dedb1fe91ae001766717081dd71bc376ff8d8364ed601aaa80
  581e7d685c490c7b9f1d6ac58322526bd79235713310757904296286c90db86a5f6521a264545573ee60480de35f306a9e50ddb0517ff69383f04f5fa3c51fac
)
md5sums=(
  290c38d6e8519b8746f0b33757b9a3a7
  360632afffdc410201fa3219359d9586
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
