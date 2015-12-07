# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

_pkgname=symfony-installer
pkgname=symfony-installer-bin
pkgver=1.4.4
pkgrel=2
pkgdesc="The Symfony Installer"
url="https://github.com/symfony/symfony-installer"
license=('MIT')
arch=('any')
depends=('php>=5.4.0')
provides=('symfony-installer')
conflicts=('symfony-installer')
source=($_pkgname::http://symfony.com/installer)
sha512sums=('1d2d489941242f4757e7e6072b3c75adc633aa8bc1b22cc03b66c9966ce694509dd8f1348887a808061ea7235d946b7e12089bc6a9fb26df4054a6049005008c')
install="$_pkgname.install"


package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp -a "$srcdir/$_pkgname" "$pkgdir/opt/$_pkgname/symfony"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/symfony" "$pkgdir/usr/bin/symfony"
}

# vim: ts=2 sts=2 sw=2 et ft=sh
