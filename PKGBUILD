# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

_pkgname=symfony-installer
pkgname=symfony-installer-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="The Symfony Installer"
url="https://github.com/symfony/symfony-installer"
license=('MIT')
arch=('any')
depends=('php>=5.4.0')
provides=('symfony-installer')
conflicts=('symfony-installer')
source=("${_pkgname}_${pkgver}"::https://symfony.com/installer)
sha512sums=('d2571a02855f88c481287cf6092b7db0570f4feff2e294350e5c4e909e8d5f7d11adbfafda520c6af04f702e8655b019a4b5f493f5fee82bb20be2653bb4818e')
install="$_pkgname.install"


package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  install -D "$srcdir/${_pkgname}_${pkgver}" "$pkgdir/opt/$_pkgname/symfony"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/symfony" "$pkgdir/usr/bin/symfony"
}

# vim: ts=2 sts=2 sw=2 et ft=sh
