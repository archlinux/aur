# Maintainer:  Trey Blancher < trey at blancher dot net >
#
# Generated from npm2PKGBUILD
# 
# Note, fast-cli uses puppeteer, which cotains chromium.  The dependencies of
# chromium are included, otherwise fast-cli won't work as expected.  It's more
# than just including the library/shared object (.so/ldd) dependencies of the
# chromium binary.  This is a limitation of puppeteer.  It uses chromium's
# Javascript engine to parse and navigate web pages.  fast.com is heavily
# Javascript dependent, Netflix doesn't have a separate way to test outside of
# this web page.
#

_npmname=fast-cli
_npmver=3.2.0
pkgname=nodejs-fast-cli # All lowercase
pkgver=3.2.0
pkgrel=1
pkgdesc="Test your download and upload speed using fast.com from Netflix"
arch=(any)
url="https://github.com/sindresorhus/fast-cli#readme"
license=(MIT)
depends=(
         'alsa-lib'
         'aom'
         'brotli'
         'dav1d'
         'dbus'
         'desktop-file-utils'
         'ffmpeg'
         'flac'
         'fontconfig'
         'freetype2'
         'gtk3'
         'harfbuzz'
         'hicolor-icon-theme'
         'icu'
         'jsoncpp'
         'libcups'
         'libffi'
         'libgcrypt'
         'libjpeg'
         'libpng'
         'libpulse'
         'libva'
         'libwebp'
         'libxml2'
         'libxslt'
         'libxss'
         'minizip'
         'nodejs'
         'npm'
         'nss'
         'opus'
         'pciutils'
         're2'
         'snappy'
         'systemd'
         'ttf-liberation'
         'woff2'
         'xdg-utils'
)
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(f28160d9356163e4f43bfe596693ecac38886c16)
sha256sums=(d5a68ad0e82de530a0c94bceda2b6abf553983328bb9d27fbbc05085ddf259d3)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
