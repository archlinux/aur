# Maintainer: Adrià Cabello <adriacabellocrespo at gmail dot com>
pkgname=gaffer-bin
pkgver=1.0.2.1
pkgrel=1
pkgdesc="Gaffer is a VFX application that enables look developers, lighters, and compositors to easily build, tweak, iterate, and render scenes."
arch=('any')
url="https://github.com/GafferHQ/gaffer"
license=('BSD-3')
depends=('python')
provides=('gaffer')
source=(https://github.com/GafferHQ/gaffer/releases/download/$pkgver/gaffer-$pkgver-linux-python3.tar.gz)
noextract=("$provides-$pkgver-linux-python3.tar.gz")
md5sums=('96afd2f1bc44696cb36c3665c31c9f3b') #autofill using updpkgsums
options=('!strip')

prepare() {
  bsdtar xf "$provides-$pkgver-linux-python3.tar.gz"
}

package() {
  mkdir -p "${pkgdir}/opt"

  mv "$provides-$pkgver-linux-python3" "${pkgdir}/opt/gaffer"
}
