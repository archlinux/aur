# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='7f6f762ebd67e51f1c356fa045b19be2c0264997'
pkgname=revolt
pkgver=2021.12.16
pkgrel=1
pkgdesc='Better desktop integration for Riot.im (not only) for GNOME'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/aperezdc/revolt'
license=('GPL3')
depends=('python-gobject' 'webkit2gtk')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/aperezdc/${pkgname}/archive/${_commit}.tar.gz")
b2sums=('d9b311b081f7ba6c563c7112e2bbc40820b2a8155bfb8d8db1dc7254d0563406e4c0ff943644118d0cbe175518be818ea4d059e55abe8a1074d65116510761e2')

build() {
  cd "${pkgname}-${_commit}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${_commit}"
  make install DESTDIR="${pkgdir}"
}
