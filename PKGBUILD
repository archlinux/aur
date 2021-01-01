# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=soundwire-dkms
pkgname=${_pkgname}-git
pkgver=1.3.1.r15.8b578ac
pkgrel=1
pkgdesc="sofproject linux driver patched to support new dell hardware (xps 9700, precision 5750) on up to date kernels"
url="https://github.com/maaarghk/$_pkgname"
license=(unknown)
depends=(dkms pulseaudio sof-firmware)
source=("git+$url.git#branch=latest-sofproject")
arch=('x86_64')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  source <(grep PACKAGE_VERSION dkms.conf)
  printf "$PACKAGE_VERSION.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/src"
  cp -r "$srcdir/$_pkgname" "$pkgdir/usr/src/soundwire-$pkgver"
}

#vim: syntax=sh
