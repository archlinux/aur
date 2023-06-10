# Maintainer: Biltu Das <billionto@gmail.com>
pkgname=qsort
pkgver=0.3.3_beta
pkgrel=1
pkgdesc="Advanced file sorter for archlinux"
arch=('any')
url="https://github.com/BiltuDas1/qsort"
license=('CPL')
depends=('cmake>=3.22' 'tar')
source=("https://github.com/BiltuDas1/$pkgname/releases/download/${pkgver//_/-}/${pkgname}_v${pkgver//_/-}_1_amd64.deb")
sha256sums=("538ab917dab7e826cda1e766a6f0934a3f71c55c91f84607f381c8c5400231de")

build(){
	cd "${srcdir}"
	mkdir $pkgname
	mv data.tar.zst $pkgname
	cd $pkgname
	tar -xf data.tar.zst
	mv data.tar.zst ..
}

package(){
	cd "${srcdir}"
	mv $pkgname ../pkg/
}
