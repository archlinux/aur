# Maintainer: c0ldcat <firez199984@gmail.com>

pkgname=con2fbmap
pkgver=2.1
pkgrel=28
pkgdesc="Shows and sets mapping between consoles and framebuffer devices"
url="http://debian.org"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("http://ftp.lanet.kr/debian/pool/main/f/fbset/fbset_2.1-28.debian.tar.xz")
md5sums=("deb9d0590d660ac8cd871fe8d84072a0")

package() {
  cd "${srcdir}"
  patch -i debian/patches/03_con2fbmap.patch
  gcc con2fbmap.c -o con2fbmap
  install -Dm755 con2fbmap ${pkgdir}/usr/bin/con2fbmap
}
