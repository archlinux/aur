# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-browscap
pkgver=6004
pkgrel=1
pkgdesc="PHP browscap"
url="http://browscap.org/"
arch=('x86_64' 'i686')
license=('PHP')
depends=(
    'php'
)
backup=(
    'etc/php/conf.d/browscap.ini'
    'etc/php/extra/browscap.ini'
)

source=(
    browscap.source.ini::http://browscap.org/stream?q=Full_PHP_BrowsCapINI
    browscap.conf.ini
)

sha256sums=('2af2e9d00b95c8fb8d0fab99de853e567823160122e73e792548c5cf078e184b'
            'ab973c3fd8d4842430f70d144278c150061b6e2ff77d7b367f9921fa728ad169')

package() {
  cd "$srcdir"
  install -Dm644 browscap.source.ini "$pkgdir/etc/php/extra/browscap.ini"
  install -Dm644 browscap.conf.ini "$pkgdir/etc/php/conf.d/browscap.ini"
}
