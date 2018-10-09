# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=laverna
pkgver=0.7.51
pkgrel=11
pkgdesc="Laverna is a JavaScript note taking application with Markdown editor and encryption support. Consider it like open source alternative to Evernote."
arch=("x86_64" "i686")
depends=('gconf')
url="https://laverna.cc/"
license=('MPL2')
source=("${pkgname}.desktop")
source_x86_64=("https://github.com/Laverna/laverna/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-x64.zip")
source_i686=("https://github.com/Laverna/laverna/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-ia32.zip")
sha512sums=('7cea514f4b5ac3b380615c1286cb8bac2ef36e20425a738cd490b892748b70b4e07a1ba5828aaf4715a2ac55ab8e74367129814fa29d34bc69f71ad0b0c3a40b')
sha512sums_x86_64=('9f3d680148970e980245fc401bca9329924c4ea1b3966c6d5f4f4dbcd08d7bb4416d464b9645458367f6a2edea2ac1d63572752dfb12033bb6a210c81c52e596')
sha512sums_i686=('717df3255f2af9bedba2bf06a62b35012d73a819793f681e348d77271d896ba0fcf3ad88b43cb477cac976e90c0f1611c532bb70b2870fd9f8e21293e8b3c66e')
install=${pkgname}.install

package() {
	echo "$(tput bold)$(tput setaf 1) Laverna IS NOW DEPRECATED and UNMAINTAINED!! $(tput sgr 0)"
	echo "$(tput bold)$(tput setaf 1) Please report to https://git.io/fxcCE for more information. $(tput sgr 0)"
	echo "$(tput bold)$(tput setaf 1) We invite you to follow https://git.io/fxcWt instead. $(tput sgr 0)"

	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/{${pkgname},applications,licenses/${pkgname}}
	install -Dm644 ../913.patch ${pkgdir}/usr/share/${pkgname}

	cp -R ${srcdir}/* ${pkgdir}/usr/share/${pkgname}

	cd ${pkgdir}/usr/share/${pkgname}/resources/app/
	patch -p0 < ${pkgdir}/usr/share/${pkgname}/913.patch

	cd ${srcdir}

	install -Dm644 ../laverna.desktop ${pkgdir}/usr/share/${pkgname}
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

	echo "$(tput bold)$(tput setaf 1) Laverna IS NOW DEPRECATED and UNMAINTAINED!! $(tput sgr 0)"
	echo "$(tput bold)$(tput setaf 1) Please report to https://git.io/fxcCE for more information. $(tput sgr 0)"
	echo "$(tput bold)$(tput setaf 1) We invite you to follow https://git.io/fxcWt instead. $(tput sgr 0)"
}
