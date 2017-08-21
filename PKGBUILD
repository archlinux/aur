#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2017
pkgrel=2
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
optdepends=('python3-colorsysplus: colorized output in some scripts')
source=(
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2017.tar.xz
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2017.tar.xz.sig
)
sha512sums=(
  2f895f1db49fee6e1e8ccf3bb7524c5dbcfba41ccbb69b18249f176fd7c39588f549c770aee57240ff339879b01a2e99ff141bf1b95d7427d709719d6cf274e6
  32fdcd184896a80346a922ee33020c8cd7d186f8774baeadc113bfb6257d3eb750c4b80f857f1fdc60c9f8b4f1fc2fda9089d8505de7e79524e376ba6cae7235
)
md5sums=(
  fa5b0339b6221d9bfbbbaa19b51a3284
  666d191cb2e086cc2ae569e775297577
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
