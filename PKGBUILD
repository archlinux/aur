# Maintainer: Kodi <kodicraft4@gmail.com>
pkgname=rimpy

# We can't update this "dynamically" since some releases are not available for Linux. Maybe a deeper check could do the trick
pkgver=1.2.4.21
pkgrel=0

pkgdesc="Mod Manager For Rimworld game"
arch=('x86_64')
url="https://github.com/rimpy-custom/RimPy"
license=('Unknown')

source=("$url/releases/download/${pkgver}/RimPy_Linux.tar.gz")
md5sums=('45a780aa3f8bfccb9ffd0a4093ad8468')

package() { 
  mkdir -p "$pkgdir/usr/local/lib/$pkgname"
  cp -rL "." "$pkgdir/usr/local/lib/$pkgname/"
  chmod 755 -R "$pkgdir/usr/local/lib/$pkgname/" 
  mkdir -p "$pkgdir/usr/local/bin/"
  ln -sr "$pkgdir/usr/local/lib/$pkgname/RimPy" "$pkgdir/usr/local/bin/rimpy"
}
