# Author: Andy Bao (nulldev) <contact at andybao dot me>

_pkgname=lenovo-legion-wmi
pkgname=$_pkgname-dkms-git
pkgver=r2.3e0e12b
pkgrel=1
pkgdesc='Lenovo Legion WMI Driver'
arch=('x86_64')
url='https://github.com/null-dev/lenovo-legion-wmi-dkms'
license=('GPL3')
depends=('dkms')
provides=('lenovo-legion-wmi')
conflicts=('lenovo-legion-wmi')
source=("$_pkgname::git+https://github.com/null-dev/lenovo-legion-wmi-dkms.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -Dm644 "$srcdir/$_pkgname/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver/Makefile"
  install -Dm644 "$srcdir/$_pkgname/lenovo-legion-wmi.c" "$pkgdir/usr/src/$_pkgname-$pkgver/lenovo-legion-wmi.c"
}

