# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-pkcs
pkgver=2.8.1.0
pkgrel=3
pkgdesc='Интерфейс RSALabs PKCS#11'
arch=('x86_64')
url='https://www.rutoken.ru/support/download/pkcs/'
license=('proprietary')

_file='librtpkcs11ecp.so'
_dir="/opt/aktivco/rutokenecp/${arch}"
source=("http://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp.so")
sha256sums=('638f894d8fe11c631d7c3e999d1555ae4ed74364a2a532515529c59eea5bb7de')

package() {
	mkdir -p "${pkgdir}${_dir}" "${pkgdir}/usr/lib"
	cp -a "${srcdir}/${_file}" "${pkgdir}${_dir}"
	ln -s "${_dir}/${_file}" "${pkgdir}/usr/lib/${_file}"
}
