# Maintainer: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>

pkgname=allure-commandline
_pkgname=allure
pkgver=2.7.0
pkgrel=1
pkgdesc='A flexible lightweight multi-language test report tool with the possibility to add steps, attachments, parameters and so on.'
arch=('i686' 'x86_64')
url='http://allure.qatools.ru'
depends=('jdk8-openjdk')
source=("https://github.com/allure-framework/allure2/releases/download/${pkgver}/${_pkgname}-${pkgver}.tgz" "allure")
md5sums=('14e582816aa4c5148439dc6bc3dbe6b2' 'd5cda88380d1d44d68e3eb72df369cd9')

package() {
	cd "${srcdir}"
	install -Dm755 allure "${pkgdir}/usr/bin/allure"
	installdir="${pkgdir}/opt/${pkgname}"
	mkdir -p "${installdir}"
	for dir in bin config lib plugins
	do
		cp -r "./${_pkgname}-${pkgver}/${dir}" "${installdir}/"
	done
}
