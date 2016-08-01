#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-cactus
pkgver=2016.4
pkgrel=1
pkgdesc='Interface modules for CACTUS (CADD Group Chemoinformatics Tools and User Services).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-cactus"
depends=(python-openbabel python3 python3-memoizedb)
source=(
  http://xyne.archlinux.ca/projects/python3-cactus/src/python3-cactus-2016.4.tar.xz
  http://xyne.archlinux.ca/projects/python3-cactus/src/python3-cactus-2016.4.tar.xz.sig
)
sha512sums=(
  683ad9ac153c2842f177fd852ff60f1f193ec0bf4955bb59af0d01d08d922adab53a8ef6977468d973ca36792d5686336bf2582ff63b711ae69b75f7d1f1eedf
  c890ea326bb744fdb7179ad5ac423b0cf7e0e714638f2f3de2cf475f2f20de6d74868bfce2c5d537f758781d84b12d44123c5c15b9131e51d863a942cf0eb5a1
)
md5sums=(
  0b083abc149ab7e901561467acf7705b
  d51106fdab65ae86b8f0d57a0b1ad7d4
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for script_ in cactus-*
  do
    install -Dm755 $script_ "$pkgdir"/usr/bin/$script_
  done
}


# vim: set ts=2 sw=2 et:
