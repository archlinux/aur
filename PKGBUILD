#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=hapi
pkgver=2018
pkgrel=2
pkgdesc='Python library, command-line tools and server for annotating Mandarin Chinese with phonetics (pinyin, zhuyin, etc.) and colors by tone.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/hapi"
depends=(python-lxml python3 python3-colorsysplus wget)
optdepends=('aria2: required for downloading audio files')
source=(
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2018.tar.xz
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2018.tar.xz.sig
)
sha512sums=(
  3402ef5d9b87a8bb74b6df8095348d416aeae7ec680b1ac0528d580863a0fd0668cf36a4db658e36e5811ebfaeee3387edd38e889bbbf90ad0d1faf42ccfcc5c
  1dad5851056b84848f48f5573d90c904f9ceccb1676015f752bd2ffbd6e594b945dd9db8fbd6bdfba4bf0607c84c08705b759095aba5d7c5aa42500acfd07bb0
)
md5sums=(
  a37fd4840452977e7cafc0f414ad8552
  519d432276003e09d5dd7056c6e7aa93
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
