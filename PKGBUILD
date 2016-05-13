# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: João Raimundo <joao.raimundo@gmail.com>
# Contributor: Daniel Renninghoff <renninghoff at archlinux dot info>
# Contributor: Carl George <carl at carlgeorge dot us>
pkgname=mint-themes
pkgver=3.18+4
pkgrel=1
pkgdesc="Mint-X GTK2, GTK3, Metacity and Xfce theme."
arch=('any')
license=('GPL3')
url='http://linuxmint.com'
optdepends=('gtk-engine-murrine: for GTK2 theme'
	'mint-x-icons: Mint icon theme')
conflicts=('mint-x-theme')
source=("https://ftp.fau.de/mint/packages/pool/main/m/${pkgname}/${pkgname}_1.4.6.tar.gz"
	"https://ftp.fau.de/mint/packages/pool/main/m/${pkgname}-gtk3/${pkgname}-gtk3_${pkgver}.tar.xz")
sha256sums=('49efc330923d4aef8d55ac589bca57882a9c52f69d8efa4c588863575b09e0d2'
	'b7991cd544d09a2d9604fca33f9623e3b74f18f23dfe9beee4c07a41cf42950a')

prepare() {
	find ${srcdir} -name .gitkeep -type f -delete
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/usr" "${pkgdir}/"
	cp -dr --no-preserve=ownership "${srcdir}/${pkgname}-gtk3/usr" "${pkgdir}/"
}
