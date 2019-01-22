# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

_basename_=xz
pkgname=${_basename_}-java
pkgver=1.8
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

	sed -i "s|sourcever = 1.5|sourcever = 1.6|g" build.properties
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

sha1sums=('909eb5472e4f4185d77414b7194d59c6b85c7c66')
