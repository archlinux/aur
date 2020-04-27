#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=hapi
pkgver=2020
pkgrel=1
pkgdesc='Python library, command-line tools and server for annotating Mandarin Chinese with phonetics (pinyin, zhuyin, etc.) and colors by tone.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/hapi"
depends=(python-lxml python3 python3-colorsysplus wget)
optdepends=('aria2: required for downloading audio files')
source=(
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2020.tar.xz
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2020.tar.xz.sig
)
sha512sums=(
  81a0467b938abc444ab12510cf5227ef48f05b53615098fdd7a20090be9a639f7c654aec11553a0eb99500373727012630ee5ebe8a0ba87c864f2f56806c8b42
  cdd1a40fafffb0e64f44be83a4b5adfed975821fd587bd2f6a14f9c852b4d530e02342dcc82c14a41f96339ded6af88a02198d5d7d0e5548a62f2cfe3f18f21a
)
md5sums=(
  a446a66488ef8a9cb4fa476af5a11f4d
  1ba0b2e36d5a5b98b7422fb9b00a3da6
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
