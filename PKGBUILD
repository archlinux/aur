#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-cactus
pkgver=2021
pkgrel=15
pkgdesc='Interface modules for CACTUS (CADD Group Chemoinformatics Tools and User Services).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-cactus"
depends=(python-openbabel python3 python3-memoizedb)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/python3-cactus/src/python3-cactus-2021.tar.xz
  https://xyne.dev/projects/python3-cactus/src/python3-cactus-2021.tar.xz.sig
)
sha512sums=(
  7e2b7cad853d4a114dfd9948e57a066f163ddeb98a53fcb70f79e447abb2ccaa731e4783805f7627a164f9763c46fb87ac77402f3074f5b0e31b5488c3f57505
  98ae4640b5a0fcbba7a6332cfe6de60d915bc52c2c80c16da691723d4e0734619bc589fe58d405c11c2de0cb4c4ed94b2f0423af3ea9147cb131b5c2b5d9765b
)
md5sums=(
  c742b2679f581aed4d0a92d38df7480e
  0dcd1505aa3c2880621e94b02efab9bb
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

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
