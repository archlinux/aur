# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=steam-tweaks
pkgver=0.7.2
pkgrel=1
pkgdesc="Various tools for tweaking Steam/game settings"
arch=('any')
url="https://github.com/gamer-os/steam-tweaks"
license=('MIT')
depends=('python' 'python-yaml' 'python-vdf' 'pycrc' 'python-inotify-simple')
source=("https://github.com/gamer-os/steam-tweaks/archive/$pkgver.tar.gz")
md5sums=('c162a5837380f45979767ef32a5e0e54')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/steam-tweaks"
  mkdir -p "$pkgdir/etc/systemd/system"
  cp -r "$srcdir/steam-tweaks-$pkgver/data" "$pkgdir/usr/share/steam-tweaks"
  cp -r "$srcdir/steam-tweaks-$pkgver/compat-tools" "$pkgdir/usr/share/steam-tweaks"
  cp "$srcdir/steam-tweaks-$pkgver/steam-tweaks.yaml" "$pkgdir/usr/share/steam-tweaks"
  cp "$srcdir/steam-tweaks-$pkgver/steam-compat-tool-stub.tpl" "$pkgdir/usr/share/steam-tweaks"
  chmod -R a+r "$pkgdir/usr/share/steam-tweaks"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-config" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-patch" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-shortcuts" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-tweaks" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-compat-tool-stubs" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/tweaks-mfplat" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/steam-tweaks-$pkgver/steam-patch@.service" "$pkgdir/etc/systemd/system"
}
