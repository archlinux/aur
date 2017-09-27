#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=hapi
pkgver=2017.9
pkgrel=2
pkgdesc='Python library, command-line tools and server for annotating Mandarin Chinese with phonetics (pinyin, zhuyin, etc.) and colors by tone.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/hapi"
depends=(python-lxml python3 python3-colorsysplus wget)
optdepends=('aria2: required for downloading audio files')
source=(
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2017.9.tar.xz
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2017.9.tar.xz.sig
)
sha512sums=(
  fecd3f32319aa97773747a20e67157f9ec60de945d8a0990075236b537963eb7aedbb9e7758deed0533a68b128630a01e43de24bb59e4be44b1faaa09105febb
  5257cf2a4ea6f5b64b7554859f09076f32b08a7b6df97ed93c097ee66ec54150b3e4c6f30850f28d749042f61b287de8c3a3a57d95891bef42e6399c3e92ae04
)
md5sums=(
  03e01472c0d3c27c08bde2228dbb79d6
  0a8a5ebb83955724d71e363924fb443a
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
