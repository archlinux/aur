# Maintainer: Yadav <thylacine222@gmail.com>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Contributor: Kerrick Staley <mail at kerrickstaley.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.5.1
pkgrel=2
pkgdesc='Pinyin (Chinese) input method for the IBus framework'
arch=('x86_64')
license=('GPL')
url="https://github.com/ibus/ibus-pinyin/"
depends=('ibus' 'pyzy' 'lua')
makedepends=('intltool' 'gnome-common')
source=("https://github.com/ibus/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('2ad3e7705d3f537135576ceb165a305728739ba2965d8d50f6db8c5043f17f722ca8b42de053cdcb8ff05ef10a7f7c4a0c7f0924beefdfa197225e360c98abd9')

build() {
  cd ${pkgname}-${pkgver}

  ./autogen.sh \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make NO_INDEX=true DESTDIR="${pkgdir}" install
}
