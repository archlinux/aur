# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=shotlet
pkgver=0.1.0
pkgrel=1
pkgdesc='Screenshot and screen recording toolbar for Wayland, modelled on the one of macOS'
url='https://github.com/prietus/shotlet'
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-gobject' 'gtk4' 'gtk4-layer-shell' 'grim' 'wf-recorder' 'wl-clipboard')
optdepends=('swappy: annotate a screenshot from its thumbnail'
            'ffmpeg: thumbnails of recordings'
            'rivermonad: window mode (the windows on screen come from its IPC)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('948dbb787d1e4d60721640c2c3ae80089f5ba897c7f6ceb5c164f5603c69040e')

package() {
  cd $pkgname-$pkgver
  install -Dm755 shotlet -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
