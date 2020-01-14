# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=con2fbmap
pkgver=2.1.0
pkgrel=52
pkgdesc='Shows and sets mapping between consoles and framebuffer devices'
url='https://www.debian.org/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
source=('https://mirrors.kernel.org/debian/pool/main/f/fbset/fbset_2.1-28.debian.tar.xz')
sha512sums=('ea96e699e08d15fec4106434edf6f360e78e531dbbd81507bca8f2b31ec39fd12ba0d5c4a6c8a8a110112f3d4e83c3425ebaa59625adb24c3990d18e6f2051c9')

prepare() {
  cd "${srcdir}"
  patch -N --silent -i debian/patches/03_con2fbmap.patch &2>/dev/null
}

build() {
  cd "${srcdir}"
  gcc con2fbmap.c -o con2fbmap
}

package() {
  cd "${srcdir}"
  install -Dm755 con2fbmap "${pkgdir}/usr/bin/con2fbmap"
}
