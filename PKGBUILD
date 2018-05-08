# Maintainer: gspu <bssbk2455[at]gmail[dot]com>

pkgname=bitkeeper-development-bin
pkgver=7.3.2.0x5aaba359
pkgrel=1
pkgdesc="a fast, enterprise-ready, distributed SCM. DEVELOPMENT VERSION!!!"
arch=("x86_64")
license=("Apache 2.0")
depends=("libxft")
url="http://www.bitkeeper.org"

source_x86_64=("https://github.com/gspu/bitkeeper/releases/download/bk-${pkgver}/bk-${pkgver}-x86_64-glibc227-linux.bin")

sha256sums_x86_64=('c0aa1a75f6bf92cc373ddf134d57dce562727e6e6e280050c46ad7277991e002')

package() {

  chmod +x ${srcdir}/bk-${pkgver}-x86_64-glibc227-linux.bin
  ${srcdir}/bk-${pkgver}-x86_64-glibc227-linux.bin ${pkgdir}/opt/bitkeeper

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/bitkeeper/bk ${pkgdir}/usr/bin

  chmod go-w -R ${pkgdir}/*
}
