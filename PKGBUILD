# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=shotlet
pkgver=0.1.2
pkgrel=1
pkgdesc='Screenshot and screen recording toolbar for Wayland, modelled on the one of macOS'
url='https://github.com/prietus/shotlet'
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-gobject' 'gtk4' 'gtk4-layer-shell' 'grim' 'wf-recorder' 'wl-clipboard')
optdepends=('swappy: annotate a screenshot from its thumbnail'
            'ffmpeg: thumbnails of recordings'
            'curl: upload screenshots with the uploaders of the example file'
            'rivermonad: window mode (the windows on screen come from its IPC)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5807b70133544c103af2306d9b47d2b6ac096122eb5e7bebb7efe322cfb277c2')

package() {
  cd $pkgname-$pkgver
  install -Dm755 shotlet -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
