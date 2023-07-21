# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

_basename_=xz
pkgname=${_basename_}-java
pkgver=1.9
pkgrel=1
pkgdesc="A Java library for XZ and LZMA compression"
arch=("any")
url="http://tukaani.org/${_basename_}/java.html"
license=("Public Domain")
depends=("java-runtime>=6")
makedepends=("java-environment>=6", "ant")
source=(http://tukaani.org/${_basename_}/${pkgname}-${pkgver}.zip)

prepare() {
	cd "${srcdir}"

	sed -i "s|sourcever = 7|sourcever = 8|g" build.properties
}

build() {
	cd "${srcdir}"

	ant
}

package() {
	cd "${srcdir}"/build/jar

	install -d "${pkgdir}"/usr/lib/
	install -m 644 ${_basename_}.jar "${pkgdir}"/usr/lib/${pkgname}.jar
}

sha256sums=('b1d9a603f4fa75f0702ef84af5bcc11d03e721b6317daec1b1f81c31904bed00')
