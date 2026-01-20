# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="alacritty-use-theme-with-gnome-darkmode"
pkgver=1.0.0
pkgrel=1
pkgdesc="Changes alacritty theme when clicking the 'Dark Style' button in Gnome's System tray"
arch=('x86_64')
url="https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode"
license=('GPL-1.0-or-later')
depends=('bash' 'awk' 'alacritty-use-theme')
provides=('alacritty-listen-to-colorscheme.service')
conflicts=('alacritty-use-theme-with-gnome-darkmode-git')
replaces=('alacritty-toggle-theme-on-darkmode-git')
source=("$pkgname-$pkgver::https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode/archive/refs/tags/v$pkgver.tar.gz")


package() {
  cd "$pkgname-$pkgver"

  # systemd units
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/config/systemd/user/alacritty-listen-to-colorscheme.service "$pkgdir/usr/lib/systemd/user/alacritty-listen-to-colorscheme.service"

  # toggle-mode-on-dbus-signal
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/local/alacritty-use-theme/bin/toggle-mode-on-signal.sh "$pkgdir/usr/bin/alacritty-use-theme/toggle-mode-on-signal.sh"

  # documentation
  install -Dm644 $srcdir/$pkgname-$pkgver/docs/alacritty-toggle-theme-on-darkmode.md "$pkgdir/usr/share/docs/$pkgname/README.md"
}

sha256sums=('82f06b515064f2bb89e63bcf33c1fe433dc2b266905a9d1eaeeceb092eed1f3d')
