#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=hapi
pkgver=2021
pkgrel=16
pkgdesc='Python library, command-line tools and server for annotating Mandarin Chinese with phonetics (pinyin, zhuyin, etc.) and colors by tone.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/hapi"
depends=(python-lxml python3 python3-colorsysplus wget)
makedepends=(python-setuptools)
optdepends=('aria2: required for downloading audio files')
source=(
  https://xyne.dev/projects/hapi/src/hapi-2021.tar.xz
  https://xyne.dev/projects/hapi/src/hapi-2021.tar.xz.sig
)
sha512sums=(
  4b91208394ab91217b99e1f88a5e58a198d33ae06ea5a08c50e9d0aa4449c644469b759ee8cbc31e7c603cffc39997b8c5d703b94c629b2bfd7cacba4e2a0ff2
  2f538d2a594174973b9cf80967828a70086957c49546dfbf947da34105602a67f16421c3b134e4a35e4ed7a42d4bf38d7eef3b6dbdc4460637d4d788caeffaaf
)
md5sums=(
  d427437faed46cf6c39aa8432b52f29f
  fa2742a0cd3c5f6a4baf4f4bb26cd824
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

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
