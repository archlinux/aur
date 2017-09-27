#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=hapi
pkgver=2017
pkgrel=1
pkgdesc='Python library, command-line tools and server for annotating Chinese with phonetics and colors.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/hapi"
depends=(python-lxml python3 python3-colorsysplus wget)
optdepends=('aria2: required for downloading audio files')
source=(
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2017.tar.xz
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2017.tar.xz.sig
)
sha512sums=(
  b9121fb749d15fcea94460d8e5062831735518f3f6d3389a06ed0016a7e62ff4dbad827f39031f935f5fa8517f527de5299224477ee6a5fff21fade49a50fe11
  2a0be716ac6e761a20818ecbf0154127f98259fe7f7098e40ebdcc312ead7eaea04725da3a0b3b55e7d0160ba86e066fccfc90eaf8258fce29238f88414d0c42
)
md5sums=(
  cf96dd1f4eee7ab4af661b317dc1766f
  114c400bf0b8813cc63cb8e29c909d79
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for script_ in hapi{,-srv,-download_data}
  do
    install -Dm755 "scripts/$script_" "$pkgdir/usr/bin/$script_"
  done
}

# vim: set ts=2 sw=2 et:
