# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=quartz
pkgver=2.3.0
pkgrel=1
pkgdesc="A richly featured, open source job scheduling library that can be integrated within virtually any Java application"
arch=('any')
url="http://www.quartz-scheduler.org/"
license=('APACHE')
depends=('java-environment' 'log4j' 'slf4j')
options=(!strip)
source=(http://www.quartz-scheduler.org/downloads/files/$pkgname-$pkgver-distribution.tar.gz)
md5sums=('6ce653a630b089b951c56a27e66f693d')

package() {
  cd "$srcdir"/$pkgname-$pkgver-SNAPSHOT/

  mkdir -p "$pkgdir"/usr/share/java/$pkgname/

  for i in c3p0-0.9.5.2.jar quartz-$pkgver-SNAPSHOT.jar quartz-jobs-$pkgver-SNAPSHOT.jar; do
     install -m644 lib/$i "$pkgdir"/usr/share/java/quartz/
  done

  cd "$pkgdir"/usr/share/java/quartz/
  ln -s c3p0-0.9.5.2.jar c3p0.jar
  ln -s quartz-$pkgver-SNAPSHOT.jar quartz.jar
  ln -s quartz-jobs-$pkgver-SNAPSHOT.jar quartz-jobs.jar
}
