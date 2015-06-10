# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=quartz
pkgver=2.2.1
pkgrel=1
pkgdesc="A richly featured, open source job scheduling library that can be integrated within virtually any Java application"
arch=('any')
url="http://www.quartz-scheduler.org/"
license=('APACHE')
depends=('java-environment' 'log4j' 'slf4j')
options=(!strip)
source=(http://d2zwv9pap9ylyd.cloudfront.net/$pkgname-$pkgver-distribution.tar.gz)
md5sums=('24d02d71a27ada1e41b2df822277d268')

package() {
  cd "$srcdir"/$pkgname-$pkgver/

  mkdir -p "$pkgdir"/usr/share/java/$pkgname/

  for i in c3p0-0.9.1.1.jar quartz-$pkgver.jar quartz-jobs-$pkgver.jar; do
     install -m644 lib/$i "$pkgdir"/usr/share/java/quartz/
  done

  cd "$pkgdir"/usr/share/java/quartz/
  ln -s c3p0-0.9.1.1.jar c3p0.jar
  ln -s quartz-$pkgver.jar quartz.jar
  ln -s quartz-jobs-$pkgver.jar quartz-jobs.jar
}
