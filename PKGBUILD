# Maintainer: Allen Zhong <moeallenz@gmail.com>
pkgname=asar-apache
pkgver=r40
pkgrel=1
pkgdesc="A System Activity Reporter of apache httpd"
arch=(i686 x86_64)
url="http://code.google.com/p/python-asar/"
license=('GPL2')
depends=('apache')
source=("http://python-asar.googlecode.com/svn-history/$pkgver/trunk/asar-apache-agent/asar_apache_agent.c")
md5sums=('ae8af0c209828408496c8a09adf51102')

build() {
  cd "$srcdir"

  gcc -o asar_apache_agent asar_apache_agent.c
}

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/sbin
  install -Dm755 asar_apache_agent "$pkgdir"/usr/sbin/
}

