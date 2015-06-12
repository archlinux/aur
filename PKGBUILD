pkgname=bugzilla-l10n-ru
pkgver=4.4.4
_date=20140422
pkgrel=1
pkgdesc="russian localization for bugzilla"
arch=(any)
url="http://sourceforge.net/projects/bugzilla-ru/"
license=('GPL')
depends=('bugzilla')
options=()
source=(http://downloads.sourceforge.net/project/bugzilla-ru/bugzilla-4.4-ru/$pkgver/bugzilla-$pkgver-ru-${_date}.tar.gz)
md5sums=('ddbb32cd91f365592ea074283f0e07e8')

build() {
  mkdir -p $pkgdir/srv/http
  cp -a $srcdir/bugzilla-$pkgver.ru $pkgdir/srv/http/bugzilla
  find $pkgdir/srv/http/bugzilla -type f -exec chmod 0644 {} \;
  find $pkgdir/srv/http/bugzilla -type d -exec chmod 0755 {} \;
  mv $pkgdir/srv/http/bugzilla/template/ru-RU $pkgdir/srv/http/bugzilla/template/ru
}
