# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='0aca6c862fdcb262089bacfa3c43f8ff8ceb1f83'
pkgname=revolt
pkgver=2020.09.30
pkgrel=1
pkgdesc='Better desktop integration for Riot.im (not only) for GNOME'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/aperezdc/revolt'
license=('GPL3')
depends=('python-gobject' 'webkit2gtk')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/aperezdc/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('27c7b01766cdfc35db64af67c59f165b980417ce7d1a37da636a84a21f6a7550')

build() {
  cd "${pkgname}-${_commit}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${_commit}"
  make install DESTDIR="${pkgdir}"
}
