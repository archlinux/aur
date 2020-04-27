#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2020
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pkg_scripts"
depends=(pyalpm python3 python3-xcpf)
optdepends=('python3-colorsysplus: colorized output in some scripts')
source=(
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2020.tar.xz
  https://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2020.tar.xz.sig
)
sha512sums=(
  062a61924139ac8adc87f344333611ac6eea379a51704b0e20fcbb64d54f949162ef3642f4c981adabf902d9009d46d12b292db96e823a6e89fe7aed8cd3998b
  e76ecd917595dedae130fbc36ab2d1ad22449ce26603a0fc718ddf18e387061bc6d9737d0f9c74c6a08c2c9d7568d5ddf3568d0826104d097742ff1b728bda69
)
md5sums=(
  e0e0cb199a1c715a733c574ebe5766dc
  90aa66ac845fc24eb7c2dfba5de519ae
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
