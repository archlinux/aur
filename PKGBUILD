# Maintainer: Naleo Hyde <naleo dot hyde at gmail dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

pkgname=i3exit
pkgver=2
pkgrel=2
pkgdesc="Systemd/OpenRC-compatible exit-script for i3, including 'blurlock'"
arch=('any')
license=('GPL')
depends=('i3-wm'
    'i3lock'
    'imagemagick')
optdepends=('lightdm-gtk-greeter: switch user with lightdm'
            'xss-lock: blurlock as screensaver')
source=("$pkgname"
    'blurlock'
    'i3exit.install'
    'config')
install="$pkgname.install"
md5sums=('896d9d0941aa842ceed36c1ddb758f38'
         'e3699b2b3acaa6e59e4d40d9229273ea'
         '60e55cbbc4a3a955dbaf58183604c204'
         'c182bd89c9a507142b301394aef9a89b')

package() {
	install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/i3exit
	install -Dm755 $srcdir/blurlock $pkgdir/usr/bin/blurlock
    install -Dm644 $srcdir/config   $pkgdir/etc/i3exit/config
}
