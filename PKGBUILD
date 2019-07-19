# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=ssr2json
pkgver=1.0.1
pkgrel=2
pkgdesc="A series of scripts for converting SSR links into JSON profiles for shadowsocksr."
arch=('i386' 'x86_64' 'arm' 'armv7h' 'aarch64')
url="https://github.com/fkxxyz/ssr2json"
license=('GPL3')
depends=('curl' 'shadowsocksr')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
