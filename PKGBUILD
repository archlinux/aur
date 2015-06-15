# Maintainer: Joost Bremmer <toost dot b at gmail dot com >
pkgname=steam-appmanifest-git
pkgver=1.0.r5.gc690470
pkgrel=1
pkgdesc="a short python script that tricks Steam for Linux into downloading non-Linux apps."
arch=(any)
url="https://github.com/dotfloat/steam-appmanifest"
license=('MIT')
depends=('python' 
         'python-gobject')

makedepends=('git')

source=(${pkgname}::'git+https://github.com/dotfloat/steam-appmanifest.git')

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}



package() {
  cd "${srcdir}/${pkgname}"
  install -Dvm755 "steam-appmanifest.py" "${pkgdir}/usr/bin/steam-appmanifest"
}

# vim:set ts=2 sw=2 et:
