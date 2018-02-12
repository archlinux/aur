# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=laverna
pkgver=0.7.51
pkgrel=3
pkgdesc="Laverna is a JavaScript note taking application with Markdown editor and encryption support. Consider it like open source alternative to Evernote."
arch=("x86_64" "i686")
depends=('gconf')
url="https://laverna.cc/"
license=('MPL2')
source=("${pkgname}.desktop")
source_x86_64=("https://github.com/Laverna/laverna/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-x64.zip")
source_i686=("https://github.com/Laverna/laverna/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-ia32.zip")
sha512sums=('1af2b864fea43f3c86a7ac45706ba05f409e40750dd931f8fca5b0fcd0219cf8254ba8071487ed7738c285e84bcb589837098e4d516f19b70ddff44812859545')
sha512sums_x86_64=('9f3d680148970e980245fc401bca9329924c4ea1b3966c6d5f4f4dbcd08d7bb4416d464b9645458367f6a2edea2ac1d63572752dfb12033bb6a210c81c52e596')
sha512sums_i686=('717df3255f2af9bedba2bf06a62b35012d73a819793f681e348d77271d896ba0fcf3ad88b43cb477cac976e90c0f1611c532bb70b2870fd9f8e21293e8b3c66e')

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/{${pkgname},applications,licenses/${pkgname}}

	cp -R ${srcdir}/* ${pkgdir}/usr/share/${pkgname}

	ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

	cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
