#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2018
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
optdepends=('python3-colorsysplus: colorized output in some scripts')
source=(
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2018.tar.xz
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2018.tar.xz.sig
)
sha512sums=(
  b094a385d46b33910f0752b3be0c3a79a1ebb8c0642fca144efcf0c31a14410edc45606b0428d8a7dd52151225dbe3d6c01f71d0e9368d6fda5d9577723f5f9f
  05ce3e30fddf3d0fd5b98749647c55bdaab943c657a3fa43fca1649971ddfabcc91b02e90715a486d4f1347e50f2e88d0ee0c264906dabc5239905b8d4b3701d
)
md5sums=(
  61338d767d12064b2b2fa2c05bfbdfae
  f74faf2e4d2b6212c3a355a5516f6890
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
