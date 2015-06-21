#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-cactus
pkgver=2012.12
pkgrel=4
pkgdesc='Interface modules for CACTUS (CADD Group Chemoinformatics Tools and User Services).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-cactus"
depends=(python3 python-openbabel python3-memoizedb)
source=(
  http://xyne.archlinux.ca/projects/python3-cactus/src/python3-cactus-2012.12.tar.xz
  http://xyne.archlinux.ca/projects/python3-cactus/src/python3-cactus-2012.12.tar.xz.sig
)
sha512sums=(
  078517144ab426af206ac0bea1c5a8f1306372065231cc181724bbd47c09090278dd2eb90167ba2a43e7aff755d35592b8eb395d9a453a4e11bbe0f3e3d8ca48
  f7b81dfccdafcf524a92765b0f08a02295fd248185d7b9f16369d6e6fe0d6f465c3274f7435a5a7a931ec5f438f129cdaf9f736ffc8475c3f2074513ba6dfcc5
)
md5sums=(
  e82dd3b1fc6dd07206a329924e6f560c
  c3ecdba4e9a23b2cbc7194c1ea553b79
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
