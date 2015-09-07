# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=shellcheck
pkgname="${_pkgname}-bin"
pkgver=0.3.7
pkgrel=1
pkgdesc="A shell script static analysis tool: Ubuntu binary build"
arch=("i686" "x86_64")
url="http://www.shellcheck.net/"
license=('AGPL3')
depends=("gmp" "libffi")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_i686=("http://archive.ubuntu.com/ubuntu/pool/universe/s/${_pkgname}/${_pkgname}_${pkgver}-1_i386.deb")
source_x86_64=("http://archive.ubuntu.com/ubuntu/pool/universe/s/${_pkgname}/${_pkgname}_${pkgver}-1_amd64.deb")
md5sums_i686=("470c55b1d2e01d798da52b7047f9910e")
md5sums_x86_64=("8cd0fcf8c7eade51890b15e5b05cfc98")

package() {
  cd "${srcdir}"

  bsdtar -xf data.tar.xz

  # binary
  install -D -m 755 \
          "${srcdir}"/usr/bin/"${_pkgname}" \
          "${pkgdir}"/usr/bin/"${_pkgname}"

  # license
  install -D -m 644 \
          "${srcdir}"/usr/share/doc/"${_pkgname}"/copyright \
          "${pkgdir}"/usr/share/licenses/"${_pkgname}"/LICENSE

  # manpage
  install -D -m 644 \
          "${srcdir}"/usr/share/man/man1/"${_pkgname}".1.gz \
          "${pkgdir}"/usr/share/man/man1/"${_pkgname}".1.gz
}
