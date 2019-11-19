#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-cactus
pkgver=2017
pkgrel=6
pkgdesc='Interface modules for CACTUS (CADD Group Chemoinformatics Tools and User Services).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-cactus"
depends=(python-openbabel python3 python3-memoizedb)
source=(
  https://xyne.archlinux.ca/projects/python3-cactus/src/python3-cactus-2017.tar.xz
  https://xyne.archlinux.ca/projects/python3-cactus/src/python3-cactus-2017.tar.xz.sig
)
sha512sums=(
  0dd3d139642ec72d9698e51a45778dc47983933655d51eecdf131d130b5aeaf5afefb05e7370e9ad672555bc8eb108ec249c78a4395de7d4740142692b209cc1
  316089036b7b7ac71146767464bb2b0a73ee4123bc8a111c58cd6bb22ca7fb962688c2e4e1e9ba9237264059b8f8148957edb6edbd6b6410ef8f0eaa08ce2249
)
md5sums=(
  868d09656b8b80aa833a5b4b590cb8a1
  5b420b486671511817b46bd0a30c312a
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
