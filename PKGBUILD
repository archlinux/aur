# Maintainer: buckket <buckket@cock.li>

pkgname=bitkeeper-bin
pkgver=7.2ce
pkgrel=1
pkgdesc="a fast, enterprise-ready, distributed SCM"
arch=("i686" "x86_64")
license=("Apache")
depends=("libxft")
url="https://www.bitkeeper.org"

source_i686=("https://www.bitkeeper.org/downloads/${pkgver}/bk-${pkgver}-x86-glibc23-linux.bin")
source_x86_64=("https://www.bitkeeper.org/downloads/${pkgver}/bk-${pkgver}-x86_64-glibc23-linux.bin")

md5sums_i686=("c055f0ad86c9425744ed323fe2e26e81")
md5sums_x86_64=("1e4b310554b0da6ca10e8caee08b5cf1")

package() {
  _arch=${CARCH}
  if [ "${_arch}" == "i686" ]; then
    _arch=x86
  fi

  chmod +x ${srcdir}/bk-${pkgver}-${_arch}-glibc23-linux.bin
  ${srcdir}/bk-${pkgver}-${_arch}-glibc23-linux.bin ${pkgdir}/opt/bitkeeper

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/bitkeeper/bk ${pkgdir}/usr/bin

  chmod go-w -R ${pkgdir}/*
}
