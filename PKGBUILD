#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=hapi
pkgver=2017.12
pkgrel=1
pkgdesc='Python library, command-line tools and server for annotating Mandarin Chinese with phonetics (pinyin, zhuyin, etc.) and colors by tone.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/hapi"
depends=(python-lxml python3 python3-colorsysplus wget)
optdepends=('aria2: required for downloading audio files')
source=(
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2017.12.tar.xz
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2017.12.tar.xz.sig
)
sha512sums=(
  9bf506ca6841c67acd5e350db6079f7c9f47c1d347d65e1b166622f44fbc1c1fcfe43dcab866c3096593c25a027d858a51081596369bf748e007b84efaf677ed
  1db00379ae9aa164e1ef92fcee4129bf54b1332da7680f88a86b532d9342157e0de98c4b9a108ef4115762c3d8ca964cfbb4e4a8aa8a6f11caf9ed77f95235b8
)
md5sums=(
  5b30676f6b831f0fb9757bfe9d818102
  058959553571d8acaa552ee7167b1561
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
