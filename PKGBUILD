# Maintainer: EndeavourOS-Team <info@endeavouros.com>

pkgname=reflector-simple
pkgdesc="Simple GUI wrapper for 'reflector'."
pkgver=2.0
pkgrel=1
arch=('any')
license=('GPL')
depends=(
  bash yad reflector whois geoip bind
)

url="https://github.com/endeavouros-team/PKGBUILDS/raw/master/$pkgname"

source=(
  $pkgname
  $pkgname.desktop
  $pkgname.svg
)
sha512sums=('ace126e97637fbe7a4a196485f2ccbf004f9b585bfab0d0360f1caf97594ebdb3533e80a6364a4d5dc2ceff242f6df6f2d14ddd30560037dd169ec392ce401c8'
            'b3b6d69a9af877e02d07620d2df085d72811d5ac55d1e2a5ca3fab03663849be3054fde2c026da98cb630a77ea0912423aa40932361bd24d24e15f9fb8835ca2'
            '1d904cf0b7ae64052f70a77ff3a102e8741b54cd4bf81fce25eef2c3d475291aa79a3c8c39d63b13e28753d33ed4b0106bd896cd50952c26a7c79cbf5795157f')

package() {
  cd $srcdir

  sed -i $pkgname -e "s|local VERSION_INFO=.*$|local VERSION_INFO=${pkgver}-$pkgrel|"

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/applications
  install -d $pkgdir/usr/share/pixmaps/

  install -Dm755 $pkgname         $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.svg     $pkgdir/usr/share/pixmaps/$pkgname.svg
}
