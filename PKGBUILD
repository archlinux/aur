# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: casa <sympho08@yandex.ru>

pkgname=mednaffe
pkgver=0.9.3
_commit=9d7df3c9de58554cac5a902e36e8058002421020
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator"
arch=('x86_64')
url="https://github.com/AmatCoder/mednaffe"
license=('GPL-3.0-only')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'mednafen')
makedepends=('git')
source=("git+https://github.com/AmatCoder/mednaffe.git#commit=$_commit")
sha1sums=('SKIP')

build() {
  cd "${srcdir}"/$pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname
  make prefix="${pkgdir}"/usr install
}
