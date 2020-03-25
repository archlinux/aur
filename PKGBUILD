# Maintainer: BrLi <brli@chakralinux.org>

pkgname=ttf-webhostinghub-glyphs
pkgver=1.0
pkgrel=8
pkgdesc='WebHostingHub Glyphs icon font by webhostinghub.com'
arch=('any')
url='https://www.webhostinghub.com/glyphs/'
license=('OFL')
makedepends=('fontforge')
source=('https://www.webhostinghub.com/glyphs/resources/whhg-font.zip'
        'rename.pe')
sha256sums=('c299b4c0fc02a2cc4b8efe8ddeb5cc9d13fcd5f86bcb83d4ff35326a82f9db97'
            'e26a38873f73098c1c51420bcffc064c78d7f63fe2f0b009be4aea91ac7c3dab')

prepare() {
  cp -rv $srcdir/whhg-font/font/webhostinghub{-,}glyphs.ttf
  fontforge -script ./rename.pe $srcdir/whhg-font/font/webhostinghubglyphs.ttf
}

package() {
  install -Dm644 $srcdir/whhg-font/font/webhostinghub-glyphs.ttf $pkgdir/usr/share/fonts/TTF/webhostinghub-glyphs.ttf
  install -Dm644 $srcdir/whhg-font/font/webhostinghubglyphs.ttf $pkgdir/usr/share/fonts/TTF/webhostinghubglyphs.ttf
}
