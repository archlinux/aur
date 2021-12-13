#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-cactus
pkgver=2021
pkgrel=2
pkgdesc='Interface modules for CACTUS (CADD Group Chemoinformatics Tools and User Services).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-cactus"
depends=(python-openbabel python3 python3-memoizedb)
source=(
  https://xyne.dev/projects/python3-cactus/src/python3-cactus-2021.tar.xz
  https://xyne.dev/projects/python3-cactus/src/python3-cactus-2021.tar.xz.sig
)
sha512sums=(
  7e2b7cad853d4a114dfd9948e57a066f163ddeb98a53fcb70f79e447abb2ccaa731e4783805f7627a164f9763c46fb87ac77402f3074f5b0e31b5488c3f57505
  cb8a3d1a6f7cc754a737628985d41474d15cbeea9a58fb6903532f56b0a8439e2d4931cc3d23a5201297b9ff94f80d05fb4585584383e65be4d1a14ed79a5c47
)
md5sums=(
  c742b2679f581aed4d0a92d38df7480e
  60189ff046f2272c8345e3d416509f84
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
