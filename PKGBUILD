# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

_pkgname=symfony-installer
pkgname=symfony-installer-bin
pkgver=1.5.11
pkgrel=1
pkgdesc="The Symfony Installer"
url="https://github.com/symfony/symfony-installer"
license=('MIT')
arch=('any')
depends=('php>=5.4.0')
provides=('symfony-installer')
conflicts=('symfony-installer')
source=("${_pkgname}_${pkgver}"::https://get.symfony.com/symfony.phar)
sha512sums=('01e6d46c0e1269ca4ad568f92e2559a3e058396690917ca3ef99d097ada5d4f5cc36532a2f674fa5fe8cd9745de7a4858216c7c4f5ffd68ee5051b78d5c99dc9')
install="$_pkgname.install"


package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  install -D "$srcdir/${_pkgname}_${pkgver}" "$pkgdir/opt/$_pkgname/symfony"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/symfony" "$pkgdir/usr/bin/symfony"
}

# vim: ts=2 sts=2 sw=2 et ft=sh
