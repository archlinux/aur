# Maintainer: daert781 < gmail-com: daert781 >

pkgname=librefox-cfg
ffver=64.0.0
pkgver=2.1
pkgrel=1
pkgdesc="Librefox: Firefox with privacy enhancements (configuration files set)"
arch=(i686 x86_64)
license=(MPL)
url="https://github.com/intika/Librefox"
depends=(firefox)
source=("$url/releases/download/Librefox-v$pkgver-v$ffver/Librefox-$pkgver-Firefox-Linux-$ffver.zip")
sha512sums=('32f9f9aca614d8229c3aabcc83b7b433f8966a8ff7be1abb5e5b32b328f5f4dbad780cd8aef02cc80402c6323fed5ae3676f03d17d698597a668777334acb220')

package() {
  ffdir="$pkgdir/usr/lib/firefox"
  install -dm755 "$ffdir"/{defaults/pref,distribution}

  cd "$srcdir"
  install -Dm644 "defaults/pref/local-settings.js" "$ffdir/defaults/pref/local-settings.js"
  install -Dm644 "distribution/policies.json" "$ffdir/distribution/policies.json"
  install -Dm644 "mozilla.cfg" "$ffdir/mozilla.cfg"
}
