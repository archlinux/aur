# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=transcribe
pkgver=9.00
pkgrel=1
pkgdesc="music transcription aid"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe/overview.html"
license=('unknown')
depends=('libsm' 'gtk3' 'gst-plugins-base-libs')
source_x86_64=('https://www.seventhstring.com/xscribe/xscsetup.tar.gz')
md5sums_x86_64=('7d6b92414bfa3324dfa062887328175b')

package() {
	cd "$srcdir/$pkgname"

  # Executable.
  install -Dm0755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Library.
  lib="libgstvideosection.so"
  if [ -e "$lib" ]; then
    install -Dm0755 "$lib" "$pkgdir/usr/lib/gstreamer-1.0/$lib"
  fi
}

# vim:set ts=2 sw=2 et:
