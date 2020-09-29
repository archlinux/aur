# Maintainer: Tiago Debastiani <debastianister@gmail.com>

pkgname=brmodelo
pkgver=3.31
pkgrel=2
epoch=
pkgdesc="Ferramenta de Modelagem de Bancos de Dados Relacionais"
arch=('any')
url="http://www.sis4.com/brModelo/index.html"
license=('GPL3')
depends=('java-runtime>=8')
install=brModelo.install
source=("$pkgname-$pkgver.jar::https://github.com/chcandido/brModelo/releases/download/$pkgver/brModelo.jar"
		"https://github.com/chcandido/brModelo/raw/$pkgver/Ajuda.brMh"
		"icon.png"
		"brModelo.sh"
		"brModelo.desktop")
noextract=("$pkgname-$pkgver.jar")
md5sums=('2ed50e3fa966829caa447c0d64b9a149'
		 'f657ef19358d3cf5fbbbdfe3bdb7931d'
         '0f677c27e3af9f1a9b3ae31d0197176c'
         'eb9be16b05955c3eb81d766156b77d27'
         '3aaad69042db5a54aed691d58f3e8058')

package() {
	cd "${srcdir}"
	install -D -m644 "$pkgname-$pkgver.jar" "${pkgdir}/opt/brModelo/brModelo.jar"
	install -D -m644 "Ajuda.brMh" "${pkgdir}/opt/brModelo/Ajuda.brMh"
	install -D -m755 "brModelo.sh" "${pkgdir}/usr/bin/brModelo"
	install -D -m644 "brModelo.desktop" "${pkgdir}/usr/share/applications/brModelo.desktop"
	install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/brModelo.png"
}

