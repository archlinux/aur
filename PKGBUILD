# Maintainer: Husam Bilal <me@husam.dev>

pkgname=php7-symlinks
pkgver=1
pkgrel=1
pkgdesc='Symlinks PHP7 binaries and configuration without the "7" suffix'
arch=('any')
depends=('php7')
provides=('php')
conflicts=('php')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"
  ln -s php7 php
  ln -s php-fpm7 php-fpm

  install -dm755 "$pkgdir/etc/"
  cd "$pkgdir/etc/"
  ln -s php7 php

  install -dm755 "$pkgdir/usr/lib/systemd/system/"
  cd "$pkgdir/usr/lib/systemd/system/"
  ln -s php-fpm7.service php-fpm.service

  install -dm755 "$pkgdir/run/"
  cd "$pkgdir/run/"
  ln -s php-fpm7 php-fpm
}
