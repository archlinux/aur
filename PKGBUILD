#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-cactus
pkgver=2016
pkgrel=1
pkgdesc='Interface modules for CACTUS (CADD Group Chemoinformatics Tools and User Services).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-cactus"
depends=(python-openbabel python3 python3-memoizedb)
source=(
  http://xyne.archlinux.ca/projects/python3-cactus/src/python3-cactus-2016.tar.xz
  http://xyne.archlinux.ca/projects/python3-cactus/src/python3-cactus-2016.tar.xz.sig
)
sha512sums=(
  8e2bb48e9a82e2c6d2035a800b1358b328e7c2da5d145f2172f5ba5a4cb659e650cfd748d10e7875cdf96ab9da96002028fb5f4107b042ff29325388dba2b7a5
  a903838141c6c4fe6e69f39320f8c9c2b8d7862a876a9c07986c497a0861bb311711e6eb5ae47dd9fd3964dcc5bd0087077ec425090b356c9430f90462b1cff3
)
md5sums=(
  0bcc821ebb5ed3b68c3300333102ca80
  8c6394869484bf084f9539a841c72630
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
