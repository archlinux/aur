# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

_pkgname=symfony-installer
pkgname=symfony-installer-bin
pkgver=1.5.10
pkgrel=1
pkgdesc="The Symfony Installer"
url="https://github.com/symfony/symfony-installer"
license=('MIT')
arch=('any')
depends=('php>=5.4.0')
provides=('symfony-installer')
conflicts=('symfony-installer')
source=("${_pkgname}_${pkgver}"::https://get.symfony.com/symfony.phar)
sha512sums=('5d396d8c7bc3fbf158a45c1455861d3259b9f5cc3159e61fb3d6bf19e4208e89fb8555395906e151a2851cbf9b6d1ff9b87c834e2ed5fded0e4a965f7ab153aa')
install="$_pkgname.install"


package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  install -D "$srcdir/${_pkgname}_${pkgver}" "$pkgdir/opt/$_pkgname/symfony"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/symfony" "$pkgdir/usr/bin/symfony"
}

# vim: ts=2 sts=2 sw=2 et ft=sh
