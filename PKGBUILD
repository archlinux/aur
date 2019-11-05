# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=steam-buddy
pkgver=0.0.2
pkgrel=1
pkgdesc="..."
arch=('any')
url="https://github.com/gamer-os/steam-buddy"
license=('MIT')
depends=('python' 'python-bottle' 'steam-tweaks' 'retroarch' 'libretro-genesis-plus-gx' 'libretro-nestopia' 'libretro-snes9x' 'retroarch-autoconfig-udev-git')
source=("https://github.com/gamer-os/steam-buddy/archive/$pkgver.tar.gz")
md5sums=('f1e8e3acc0d999dde52dad7d7bcb3aea')

package() {
  mkdir -p "$pkgdir/etc/systemd/system"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/steam-buddy/images"
  mkdir -p "$pkgdir/usr/share/steam-buddy/views"
  mkdir -p "$pkgdir/usr/share/steam-buddy/config"
  mkdir -p "$pkgdir/var/lib/steam-buddy"
  install -m 755 "$srcdir/steam-buddy-$pkgver/bin/nes" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-buddy-$pkgver/bin/snes" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-buddy-$pkgver/bin/genesis" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/steam-buddy-$pkgver/steam-buddy.service" "$pkgdir/etc/systemd/system"
  install -m 755 "$srcdir/steam-buddy-$pkgver/steam-buddy" "$pkgdir/usr/share/steam-buddy"
  install -m 755 "$srcdir/steam-buddy-$pkgver/launcher" "$pkgdir/usr/share/steam-buddy"
  install -m 644 "$srcdir/steam-buddy-$pkgver/images/nes.png" "$pkgdir/usr/share/steam-buddy/images"
  install -m 644 "$srcdir/steam-buddy-$pkgver/images/snes.png" "$pkgdir/usr/share/steam-buddy/images"
  install -m 644 "$srcdir/steam-buddy-$pkgver/images/genesis.png" "$pkgdir/usr/share/steam-buddy/images"
  install -m 644 "$srcdir/steam-buddy-$pkgver/views/new.tpl" "$pkgdir/usr/share/steam-buddy/views"
  install -m 644 "$srcdir/steam-buddy-$pkgver/views/edit.tpl" "$pkgdir/usr/share/steam-buddy/views"
  install -m 644 "$srcdir/steam-buddy-$pkgver/config/retroarch-common.cfg" "$pkgdir/usr/share/steam-buddy/config"
}
