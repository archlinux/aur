# Maintainer: wieseltux23 <bssbk2455[at]gmail[dot]com>

pkgname=bitkeeper-development-bin
pkgver=7.3.2.8.0x5aaba359
pkgrel=1
pkgdesc="a fast, enterprise-ready, distributed SCM"
arch=("i686" "x86_64")
license=("Apache 2.0")
depends=("libxft")
url="http://www.bitkeeper.org"

#source_i686=("https://github.com/bitkeeper-scm/bitkeeper/releases/download/bk-${pkgver}/bk-${pkgver}-x86-glibc27-linux.bin")
source_x86_64=("https://github.com/gspu/bitkeeper/releases/download/bk-${pkgver}/bk-${pkgver}-x86_64-glibc227-linux.bin")

#sha256sums_i686=('41fec94fb9e001da2f43b46126ce1e52c42d0db6bd8c9afdad08c4db787e3a17')
sha256sums_x86_64=('1d7148976dbcaac26e3710b89eb2de6bf6f7c1ee8894cea53b3e9762d3bdd262')

package() {
  _arch=${CARCH}
  if [ "${_arch}" == "i686" ]; then
    _arch=x86
  fi

  chmod +x ${srcdir}/bk-${pkgver}-${_arch}-glibc227-linux.bin
  ${srcdir}/bk-${pkgver}-${_arch}-glibc227-linux.bin ${pkgdir}/opt/bitkeeper

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/bitkeeper/bk ${pkgdir}/usr/bin

  chmod go-w -R ${pkgdir}/*
}
