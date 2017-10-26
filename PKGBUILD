# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

_pkgname=symfony-installer
pkgname=symfony-installer-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="The Symfony Installer"
url="https://github.com/symfony/symfony-installer"
license=('MIT')
arch=('any')
depends=('php>=5.4.0')
provides=('symfony-installer')
conflicts=('symfony-installer')
source=("${_pkgname}_${pkgver}"::https://symfony.com/installer)
sha512sums=('f9c380c58157c6a1c7bf8f4e67947697f842f2a123a87098d6b2a796fcf2407e68a67ddf0a3acb30c8bcb434906445b47d2d962f396c235d8cb44e986d99323e')
install="$_pkgname.install"


package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  install -D "$srcdir/${_pkgname}_${pkgver}" "$pkgdir/opt/$_pkgname/symfony"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/symfony" "$pkgdir/usr/bin/symfony"
}

# vim: ts=2 sts=2 sw=2 et ft=sh
