# Maintainer: okhsunrog <me@okhsunrog.ru>
# Contributor: another <code § deadcode § eu>

_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2024.01"
_pkgversuffix="+dfsg-5"
pkgrel=5
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}${_pkgversuffix}_all.deb")
sha256sums=('34145b998c42d2ccae4b94fe585c3263a39d04152fd71c012cf864990e3e1e62')
sha512sums=('96e7c0252a59639dddd4d4785c8bb4583c467aeceb020ce343f98cc4fc088fee4ab0eb51ba09de1aeb4b6934b861eef5e6198cbdc26a4cdf3414ea1bbbc3f7a7')
b2sums=('17361ddb22b7219830d6c39bec5b787e3041dd9f8928ccfca5a088e055a434106db1baa578c8aea3f8254818d1e46ffdd13c138c7a12bb6386f6a3ca34a2b206')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${pkgname}
	mv ./usr/share/doc/u-boot-qemu/ ./usr/share/doc/${pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
