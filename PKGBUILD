# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=laverna
pkgver=0.7.51
pkgrel=1
pkgdesc="Laverna is a JavaScript note taking application with Markdown editor and encryption support. Consider it like open source alternative to Evernote."
arch=("x86_64" "i686")
depends=('gconf')
url="https://laverna.cc/"
license=('MPL2')
source=("${pkgname}.desktop")
source_x86_64=("https://github.com/Laverna/laverna/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-x64.zip")
source_i686=("https://github.com/Laverna/laverna/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-ia32.zip")
sha512sums=('7a818455ad49f948b7a6e48d8fa9dfd20420399539afdd9754b74d0d6273f1ee1b0ee3a3f56d5c78736ea056ca2c7acbf8ecfd33112d1c06251ec008db493f0f')
sha512sums_x86_64=('9f3d680148970e980245fc401bca9329924c4ea1b3966c6d5f4f4dbcd08d7bb4416d464b9645458367f6a2edea2ac1d63572752dfb12033bb6a210c81c52e596')
sha512sums_i686=('717df3255f2af9bedba2bf06a62b35012d73a819793f681e348d77271d896ba0fcf3ad88b43cb477cac976e90c0f1611c532bb70b2870fd9f8e21293e8b3c66e')

package() {
	mkdir -p ${pkgdir}/{opt/${pkgname},usr/{bin,share/applications}}
	cp -R ${srcdir}/* ${pkgdir}/opt/$pkgname
	ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
