#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2015.12.19.3
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2015.12.19.3.tar.xz
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2015.12.19.3.tar.xz.sig
)
sha512sums=(
  92192f69bcbaf33e52b4f6c65a03d2e23c21a87c5b7788a184a6bc8ed14df3674198945d6990d29b434e19e8ee3ec48eea8190837aabac3558e97dff2abc401a
  903da00981c31b70dc00f0b97467cefd13b9b1c4fc4aa4ee75964b582ed0f0c841097e62e0414c8de4dc539fb19bafde9b5841a3502d84a79a2bfdca409128ec
)
md5sums=(
  60c05b3ffd5874ae0477ef9e2c4855d3
  62f63e005ca150203e9680f42c1df8f2
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
