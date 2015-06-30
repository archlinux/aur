# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=flightradar24
pkgver=1.0.13
pkgrel=3
pkgdesc="Feeder software for Flightradar24.com"
url="http://forum.flightradar24.com/threads/7563-Flightradar24-decoder-feeder-BETA-testing-%28Win-RPi-Linux-OSX%29"
arch=('x86_64' 'i686' 'armv6l' 'armv7l')
license=('unknown')

source_i686=("http://feed.flightradar24.com/linux/fr24feed_${pkgver}-2_i386.tgz")
sha256sums_i686=('d5a59d2837a65334ab8ff760c749b4da5f721030f8b441dc28a5f4c20a56e2f9')

source_x86_64=("http://feed.flightradar24.com/linux/fr24feed_${pkgver}-2_amd64.tgz")
sha256sums_x86_64=('71a43fd6de5e033af59ca989b85e7c724d3aace26eb11b629dab4088a3321f6c')

source_armv6l=("http://feed.flightradar24.com/raspberry-pi/fr24feed_${pkgver}-2_armv6l.tgz")
sha256sums_armv6l=('dddd8feaa5c603acf81ab00aca7dd71f4a4cec46c83cf02eaab050e1f67501ed')

source_armv7l=("http://feed.flightradar24.com/raspberry-pi/fr24feed_${pkgver}-2_armv7l.tgz")
sha256sums_armv7l=('ab54ce2ff14bceca43e28bec387d0309f8e64fe7853a6cbc6a1cb85110696ef1')

package() {
  if [[ $CARCH = "i686" ]]; then
    cd "$srcdir/fr24feed_i386"
  elif [[ $CARCH = "x86_64" ]]; then
    cd "$srcdir/fr24feed_amd64"
  elif [[ $CARCH = "armv6l" ]]; then
    cd "$srcdir/fr24feed_armv6l"
  elif [[ $CARCH = "armv7l" ]]; then
    cd "$srcdir/fr24feed_armv7l"
  fi
  install -Dm755 fr24feed "$pkgdir/usr/bin/fr24feed"
  install -Dm644 LICENSE.fr24feed "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
