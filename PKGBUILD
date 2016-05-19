# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=cmvs
pkgver=1.2
pkgrel=1
pkgdesc="Clustering Views for Multi-view Stereo."
arch=('i686' 'x86_64')
url="http://www.di.ens.fr/cmvs/"
license=('GPL')
depends=('graclus' 'gsl' 'libxext' 'libjpeg-turbo' 'atlas-lapack')
makedepends=('lapacke')
source=("http://www.di.ens.fr/cmvs/cmvs-fix2.tar.gz"
        "cmvs.patch")
md5sums=('16a6c614a081c276aa24f0986b989ba0'
         '4af833320117d109b0f0dc212a151814')

prepare() {
    cd "${pkgname}"
    patch -Np1 -i "${srcdir}/cmvs.patch"
}

build() {
	cd "${pkgname}/program/main/"
	make
}

package() {
    cd "${pkgname}/program/main/"
    install -D -t "${pkgdir}/usr/bin" pmvs2 cmvs genOption
}
