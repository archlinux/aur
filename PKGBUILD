# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-pkcs
pkgver=2.17.3.0
pkgrel=1
pkgdesc='Интерфейс RSALabs PKCS#11'
arch=('x86_64')
url='https://www.rutoken.ru/support/download/pkcs/'
license=('proprietary')

_file='librtpkcs11ecp.so'
_dir="/opt/aktivco/rutokenecp/${arch}"
source=("http://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp.so")
sha256sums=('c4386954cde86fb46398385397909b4f6909244b23b57e1f46c04d13679ae9a0')

package() {
	mkdir -p "${pkgdir}${_dir}" "${pkgdir}/usr/lib"
	cp -L "${srcdir}/${_file}" "${pkgdir}${_dir}"
	ln -s "${_dir}/${_file}" "${pkgdir}/usr/lib/${_file}"
}
