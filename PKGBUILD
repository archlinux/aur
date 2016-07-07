# Author: DiogoNSilva <o.diogosilva@gmail.com>
# Contributor: Stunts <f.pinamartins@gmail.com>

_pkgname=TriFusion
pkgname=trifusion
pkgver=0.4.0
pkgrel=1
pkgdesc="Streamlining phylogenomic data gathering, processing and visualization"
arch=("any")
url="https://github.com/ODiogoSilva/TriFusion"
licence=("GPL3")
depends=("python2-kivy" "python2-numpy" "python2-scipy" "python2-matplotlib" "python2-psutil" "python2-seaborn" "python2-configparser")
conflicts=("trifusion-git" "trifusion-bin")
source=("https://github.com/ODiogoSilva/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=("3a5e2c57ff16b6da8aedfaa31a526b78")

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	python2 setup.py install --prefix=/usr --root="${pkgdir}"
	install -Dm644 trifusion/data/resources/trifusion.desktop "${pkgdir}/usr/share/applications/trifusion.desktop"
	install -Dm644 trifusion/data/backgrounds/trifusion-icon-128.png "${pkgdir}/usr/share/pixmaps/trifusion-icon-128.png"
}
