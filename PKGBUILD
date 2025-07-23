# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-pkcs
pkgver=2.17.5.0
pkgrel=2
pkgdesc='Интерфейс RSALabs PKCS#11'
arch=('x86_64')
url='https://www.rutoken.ru/support/download/pkcs/'
license=('proprietary')
options=(!strip)

_file='librtpkcs11ecp.so'
_dir="/opt/aktivco/rutokenecp/${arch}"
source=("${_file}.${pkgver}::http://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp.so")
sha256sums=('f9aeeb433da8bfe9d0fd58b55ae40b901600e999a10d705e948dae6c6f64e016')

package() {
	mkdir -p "${pkgdir}${_dir}" "${pkgdir}/usr/lib"
	cp -L "${srcdir}/${_file}.${pkgver}" "${pkgdir}${_dir}/${_file}"
	ln -s "${_dir}/${_file}" "${pkgdir}/usr/lib/${_file}"
}
