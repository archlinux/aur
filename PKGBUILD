# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Mikael Blomstrand <gmail: kmbloms>
# Contributor: Paul B <paul2lv@gmail.com>

pkgname=fahviewer
pkgver=7.6.21
pkgrel=1
pkgdesc='Folding@home 3D Simulation Viewer'
url=https://foldingathome.org
arch=(x86_64 aarch64)
license=(GPL2)
depends=(glu glut)
source_x86_64=(https://download.foldingathome.org/releases/public/release/"${pkgname}"/debian-stable-64bit/v"${pkgver%.*}"/"${pkgname}"_"${pkgver}"-64bit-release.tar.bz2)
source_aarch64=(https://download.foldingathome.org/releases/public/release/"${pkgname}"/debian-stable-arm64/v"${pkgver%.*}"/"${pkgname}"_"${pkgver}"-64bit-release.tar.bz2)
sha256sums_x86_64=('2e3f5bde981218fbb9f5a881def08fdc52ab823a79d2f15d89927c1b03c5ae68')
sha256sums_aarch64=('3295f3a9e89d2f623929e70b2a1aaaf50fdb97d9fbb4f835a22c893e0fd5da5a')


package() {
	install -Dm755 "${srcdir}"/fahviewer_"${pkgver}"-64bit-release/FAHViewer -t "${pkgdir}"/opt/fah
	cp -r "${pkgname}"_"${pkgver}"-64bit-release/backgrounds "${pkgdir}"/opt/fah/

	install -d "${pkgdir}/usr/bin"
	ln -s /opt/fah/FAHViewer "${pkgdir}"/usr/bin/FAHViewer
}


