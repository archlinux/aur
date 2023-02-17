# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='1b35b0269f3d03e56377eb86ffdc55753524f234'
pkgname=revolt
pkgver=2023.02.16
pkgrel=1
pkgdesc='Better desktop integration for Riot.im (not only) for GNOME'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/aperezdc/revolt'
license=('GPL3')
depends=('python-gobject' 'webkit2gtk')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/aperezdc/${pkgname}/archive/${_commit}.tar.gz")
b2sums=('78c7f3fdcb8c560f2427f9cbe2ccd68731b3b7d5261761dfb3319e3b625e1c57fc9d1c238b766a2486f59b492929e71969eaaa767ca8c19aee394ca8608a23d7')

build() {
  cd "${pkgname}-${_commit}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${_commit}"
  make install DESTDIR="${pkgdir}"
}
