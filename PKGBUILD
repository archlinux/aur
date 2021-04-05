# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=phpctags
pkgver=0.9.0
pkgrel=1
pkgdesc="An enhanced PHP ctags index generator"
arch=('any')
license=('GPLv2')
url='https://packagist.org/packages/techlivezheng/phpctags'
depends=('php' 'composer')
provides=('phpctags')
conflicts=()
optdepends=()

install='phpctags.install'

source=("https://github.com/vim-php/phpctags/archive/$pkgver.zip")
md5sums=('b2edf3a9384ac37cf301ad6deabf4ef1')


package() {
  cd $pkgname-$pkgver
  ls -aslh
  composer update --ignore-platform-req=php
  php -dphar.readonly=0 buildPHAR.php
  chmod +x build/phpctags.phar
  install -Dm755 build/phpctags.phar "$pkgdir/usr/bin/phpctags"
}

# vim:set ts=2 sw=2 et:
