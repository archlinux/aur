# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=ipod-shuffle-4g
pkgver=1.5
pkgrel=1
pkgdesc="Python script for building the track and playlist database for the newer gen IPod Shuffle"
arch=('any')
url="https://github.com/nims11/IPod-Shuffle-4g"
license=('GPL2')
depends=('python')
optdepends=('espeak: Voiceover support'
            'python-mutagen: album/artist information and auto-id3-playlists support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nims11/IPod-Shuffle-4g/releases/download/v${pkgver}/IPod-Shuffle-4g-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/nims11/IPod-Shuffle-4g/releases/download/v${pkgver}/IPod-Shuffle-4g-${pkgver}.tar.gz.asc")
sha512sums=('8d7121ad5cd4bb64c8a33848ddf25d206cbef798ca5823ef0c3b1573afc010f9471e97e27da5771302e93c7cb378fac57a8e082d23af9ed7d423c0bcabdddaee'
            'SKIP')
validpgpkeys=('C838FC13F0FD455541C590412B6DAF67FFAE3F83') # Nimesh Ghelani <nimeshghelani@gmail.com>

package() {
  cd "IPod-Shuffle-4g-${pkgver}"

  # Install main script
  install -Dm755 "ipod-shuffle-4g.py" "${pkgdir}/usr/bin/ipod-shuffle-4g"

  # Add documentation
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" docs/*.md *.md
}
