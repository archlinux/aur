# Maintainer: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>

pkgname=allure-commandline
_pkgname=allure-core
pkgver=1.5.0
pkgrel=1
pkgdesc='A flexible lightweight multi-language test report tool with the possibility to add steps, attachments, parameters and so on.'
arch=('i686' 'x86_64')
url='http://allure.qatools.ru'
depends=('java-runtime')
source=("https://github.com/allure-framework/allure1/releases/download/${_pkgname}-${pkgver}/${pkgname}.tar.gz" "allure")
md5sums=('2182aea7a19ee8966665904fb7572eba' 'd5cda88380d1d44d68e3eb72df369cd9')

package() {
	cd "${srcdir}"
	install -Dm755 allure "${pkgdir}/usr/bin/allure"
	installdir="${pkgdir}/opt/${pkgname}"
	mkdir -p "${installdir}"
	for dir in app bin conf lib plugins
	do
		cp -r "./${dir}" "${installdir}/"
	done
}
