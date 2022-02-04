# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=obfs4proxy-bin
pkgver=0.0.13
pkgrel=1
pkgdesc='The obfourscator - A Pluggable Transport Proxy Written in Go (This package is built by myself for thoes who live in countries with tor censored that cannot download the source in obfs4proxy package'
arch=('x86_64')
url='https://gitweb.torproject.org/pluggable-transports/obfs4.git/'
license=('BSD')
conflicts=("${pkgname%-bin}")
makedepends=('glibc')
optdepends=('tor: you need tor to use this package')
source=('https://github.com/molaeiali/obfs4proxy-bin/raw/master/files.tar.xz')
sha512sums=('9b01700c89f5eb3f113bc51c9267af1f741c7254123f7b56cfb3871c915689538492871ae4d267d92c931aa8617211ec39b20bea70d298f35ddd60812c086a3c')

prepare() {
  cd "${srcdir}"
  tar -xvf "${srcdir}/files.tar.xz"
}

package()	{
  cd "${srcdir}/"
  install -Dm0755 $srcdir/obfs4proxy "${pkgdir}/usr/bin/obfs4proxy"
  install -Dm0644 $srcdir/obfs4proxy.1 "${pkgdir}/usr/share/man/man1/obfs4proxy.1"
  install -Dm0644 $srcdir/ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -Dm0644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


