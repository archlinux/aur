# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: MacCyber <jonas.enge at gmail dot com>
# Contributor: Jonas Heinrich <onny@project-insnaity.org>

pkgname=acestream-mozilla-plugin
pkgver=3.0.2
pkgrel=1
_ubuntuver=trusty
_ubunturel=1
_watch=('http://repo.acestream.org/ubuntu/dists/trusty/main/binary-amd64/Packages')
pkgdesc="ACE Stream multimedia plugin for web browsers"
arch=('i686' 'x86_64')
url="http://acestream.org/"
license=('unknown')
depends=('acestream-player-data' 'acestream-engine' 'qtwebkit')
conflicts=('acestream')
if [[ "$CARCH" == "i686" ]]; then
  source=("http://repo.acestream.org/ubuntu/pool/main/a/$pkgname/${pkgname}_${pkgver}-1${_ubuntuver}${_ubunturel}_i386.deb")
  sha512sums=('6fb435babf18ecb0d890fdddc31cca4e8a1f26072aa1f63f5d8fc5e4416b4892adb477ad9f6a9eb7105776316a5fe408eed60416aec2de0de25ddb84e78192f3')
else
  source=("http://repo.acestream.org/ubuntu/pool/main/a/$pkgname/${pkgname}_${pkgver}-1${_ubuntuver}${_ubunturel}_amd64.deb")
  sha512sums=('a6ede23e4c06630ff20261cd9dff07b8950ebf1a38270a1c366ff032fb8556682ef87f7f74a122755e28b107ebf8c4879ef22264dea153cfbd82253a93b5eb0f')
fi

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"
}
