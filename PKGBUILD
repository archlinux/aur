# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=pop-icon-theme
pkgver=2.1.0
_commit=ef2be602646e8e5dff1a97478a690c568e51d6aa
pkgrel=1
pkgdesc="System76 Pop Icon Theme"
arch=('any')
url='https://github.com/pop-os/icon-theme'
license=('CCPL')
depends=('gnome-icon-theme')
makedepends=('meson')
source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-icon-theme/${pkgname}_${pkgver}~1610392112~20.10~ef2be60.tar.xz")
sha512sums=('8b907b3db69e1b719d5944deb0fa92629a137f99f06e9c7041645660802a060af6e8084b1dc4b99e67a0f0d92de5d9e096daa6bca56af05584e088064d419cb3')

build() {
  cd "${_commit}_groovy"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "${_commit}_groovy"
  DESTDIR="${pkgdir}" ninja -C build install
}

