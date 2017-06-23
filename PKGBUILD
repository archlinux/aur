pkgname=shadowsocksr-libev
pkgver=4.3.1.2017.6.1
pkgrel=1
pkgdesc='A Shadowsocks branches'
arch=('i686' 'x86_64')
url='https://github.com/shadowsocksr/shadowsocksr-libev'
license=('GPL')
conflicts=('shadowsocks-libev')
depends=('libcap' 'mbedtls' 'libev' 'libsodium'
         'udns' 'pcre' 'libcorkipset' 'libbloom')
makedepends=('git' 'gcc' 'autoconf' 'libtool' 'automake' 'make' 'zlib' 'openssl' 'asciidoc' 'xmlto')
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
}




