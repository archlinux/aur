#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=hapi
pkgver=2017.11
pkgrel=1
pkgdesc='Python library, command-line tools and server for annotating Mandarin Chinese with phonetics (pinyin, zhuyin, etc.) and colors by tone.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/hapi"
depends=(python-lxml python3 python3-colorsysplus wget)
optdepends=('aria2: required for downloading audio files')
source=(
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2017.11.tar.xz
  https://xyne.archlinux.ca/projects/hapi/src/hapi-2017.11.tar.xz.sig
)
sha512sums=(
  17d75c8a2beef7101581b8bec4c21e6ae83f865f6c1597eb44a83ddc1594d7ce2fe1027ff6dba0eb0210cd779148e626bbc02e565c34f78c8375b931effff1dd
  34ed91905b70d9eef559e07357dba5878c48a6dd99cd23665c3c90365971ed085f614d6efe5a748e65631b9ff07610f8884511996502165afa9ba1bd54c5b20f
)
md5sums=(
  f83ade4dedc92aff9441b0603c7c5fbc
  c4d7cdaa0a8124cceeaacc86548c22f6
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
