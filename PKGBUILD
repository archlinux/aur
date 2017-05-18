# Maintainer: Ingo Bürk <admin at airblader dot de>

pkgname=shadowsocksr-libev
pkgver=4.3.1
pkgrel=1
pkgdesc='A Shadowsocks branches'
arch=('i686' 'x86_64')
url='https://github.com/shadowsocksr/shadowsocksr-libev'
license=('GPL')
conflicts=('shadowsocks-libev')
depends=('libcap' 'mbedtls' 'libev' 'libsodium'
         'udns' 'pcre' 'libcorkipset' 'libbloom')
makedepends=('git' 'asciidoc' 'binutils' 'gcc' 'libtool' 'autoconf' 'automake' 'bison' 'fakeroot' 'flex' 'openssl' 'make')
options=('docs' '!strip')
source=('git+https://github.com/shadowsocksr/shadowsocksr-libev.git')
sha1sums=('SKIP')

_gitname='shadowsocksr-libev'

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  ./configure && make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir/" install

  #install -Dm644 ../LICENSE \
    #"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:


