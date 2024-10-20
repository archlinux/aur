# Maintainer:  Trey Blancher < trey at blancher dot net >
#
# Generated from npm2PKGBUILD
# 
# Note, fast-cli uses puppeteer, which contains chromium.  The dependencies of
# chromium are included, otherwise fast-cli won't work as expected.  It's more
# than just including the library/shared object (.so/ldd) dependencies of the
# chromium binary.  This is a limitation of puppeteer.  It uses chromium's
# Javascript engine to parse and navigate web pages.  fast.com is heavily
# Javascript dependent, Netflix doesn't have a separate way to test outside of
# this web page.
#

pkgname=nodejs-fast-cli
_npmname=${pkgname/nodejs-/}
pkgver=4.0.0
pkgrel=4
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
         'libjpeg-turbo'
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
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  npm install -g --prefix "$pkgdir/usr" puppeteer
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
sha256sums=('a3132015439a57d18d782f11c3c5c4d27f8be867643eb8526111514966715524')
