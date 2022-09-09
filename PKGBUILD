# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=obfs4proxy-bin
pkgver=0.0.14
pkgrel=1
pkgdesc='The obfourscator - A Pluggable Transport Proxy Written in Go (This package is built by myself for thoes who live in countries with tor censored that cannot download the source in obfs4proxy package'
arch=('x86_64')
url='https://gitlab.com/yawning/obfs4'
license=('BSD')
conflicts=("${pkgname%-bin}")
makedepends=('glibc')
optdepends=('tor: you need tor to use this package')
source=("files-${pkgver}.tar.xz::https://github.com/molaeiali/obfs4proxy-bin/raw/master/files.tar.xz")
sha512sums=('273078c03d954b8f6b1ac84b852397bd6c7434268c681083c3703fef2a94b34120b19e4386d1b3bac117d5b57294f7bf5e13fa620fa8d07ef70c13f3f678c058')

prepare() {
  cd "${srcdir}"
  tar -xvf "${srcdir}/files-${pkgver}.tar.xz"
}

package()	{
  cd "${srcdir}/"
  install -Dm0755 $srcdir/obfs4proxy "${pkgdir}/usr/bin/obfs4proxy"
  install -Dm0644 $srcdir/obfs4proxy.1.gz "${pkgdir}/usr/share/man/man1/obfs4proxy.1.gz"
  install -Dm0644 $srcdir/ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -Dm0644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


