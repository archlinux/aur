# Maintainer: gspu <bssbk2455[at]gmail[dot]com>

pkgname=bitkeeper-bk
pkgver=7.3.2
pkgrel=2
pkgdesc="a fast, enterprise-ready, distributed SCM. DEVELOPMENT VERSION!!!"
arch=("x86_64")
license=("Apache 2.0")
depends=("libxft")
url="http://www.bitkeeper.org"

source_x86_64=("https://github.com/gspu/bitkeeper/releases/download/bk-${pkgver}/bk-${pkgver}-x86_64-glibc227-linux.bin")

sha512sums_x86_64=('f73332a49042a8e8c32770137df747ea780caebfcabf9e4850225aedcb8aa6828c0de450978e6334813e135cb463bab84490bc1a85f460834900ff43325ef40e')

package() {

  chmod +x ${srcdir}/bk-${pkgver}-x86_64-glibc227-linux.bin
  ${srcdir}/bk-${pkgver}-x86_64-glibc227-linux.bin ${pkgdir}/opt/bitkeeper

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/bitkeeper/bk ${pkgdir}/usr/bin

  chmod go-w -R ${pkgdir}/*
}
