# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-opentimelineio
pkgver=0.12.1
pkgrel=1
pkgdesc='API and interchange format for editorial timeline information'
arch=(any)
license=('APACHE')
makedepends=(cmake git python-pip python-setuptools)
url='https://github.com/PixarAnimationStudios/OpenTimeLineIO'
source=("git+$url#commit=cc9c067cf8482d9e703c480f31df9d22198d076a") # tag: v0.12.1
md5sums=(SKIP)

build() {
  cd OpenTimeLineIO
  python setup.py build
}

package() {
  cd OpenTimeLineIO
  python setup.py install --root="$pkgdir" --optimize=1 --user
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
