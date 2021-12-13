#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=hapi
pkgver=2021
pkgrel=3
pkgdesc='Python library, command-line tools and server for annotating Mandarin Chinese with phonetics (pinyin, zhuyin, etc.) and colors by tone.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/hapi"
depends=(python-lxml python3 python3-colorsysplus wget)
optdepends=('aria2: required for downloading audio files')
source=(
  https://xyne.dev/projects/hapi/src/hapi-2021.tar.xz
  https://xyne.dev/projects/hapi/src/hapi-2021.tar.xz.sig
)
sha512sums=(
  4b91208394ab91217b99e1f88a5e58a198d33ae06ea5a08c50e9d0aa4449c644469b759ee8cbc31e7c603cffc39997b8c5d703b94c629b2bfd7cacba4e2a0ff2
  2276d02d8e6503e8a8da86e870c35b3ff3f2f055571dcba8edcc7671ef52b3cd768365671dab63fca928cf46aa999938fe1ca2e0f7516b9802d1bd2dcde03414
)
md5sums=(
  d427437faed46cf6c39aa8432b52f29f
  56e93167c1fa2769910ce36bf05bc645
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
