# Maintainer: K1412 <jonathan@opensides.be>
pkgname=php-cas
pkgver=1.3.8
pkgrel=1
pkgdesc="CAS library for PHP"
arch=("any")
url="https://apereo.github.io/phpCAS/"
license=("Apache")
depends=('php')

source=("https://github.com/apereo/phpCAS/releases/download/${pkgver}/CAS-${pkgver}.tgz")
sha512sums=('6e89c4843ce96340ced93c6e7ad813015f8a7624928ef0ddfdc714b2d9ad55fc9b6549c413b43d4fd4dd482d806701a11212be11de689be8ede136570cda1c4b')

package() {
  # Go in directory
  cd CAS-$pkgver/

  # Create directories
  install -d -m 0755 $pkgdir/usr/share/php/CAS/
  mkdir -p $pkgdir/usr/share/doc/$pkgname/

  # Copy files
  cp -a ./CAS/* $pkgdir/usr/share/php/CAS/
  cp -a ./CAS.php $pkgdir/usr/share/php/
  cp -a ./LICENSE  ./NOTICE  ./README.md  $pkgdir/usr/share/doc/$pkgname/
  cp -a ./docs/* $pkgdir/usr/share/doc/$pkgname/
}
