pkgname=robwork
pkgver=1.1.11
pkgrel=5
pkgdesc="A collection of C++ libraries for simulation and control of robot systems"
arch=('x86_64')
url='http://www.robwork.org'
license=('APACHE')
depends=('xerces-c' 'boost' 'eigen' 'flann' 'vtk' 'qhull' 'qt5-base' 'assimp' 'fcl-git'
	'libccd' 'python' 'minizip' 'zlib')
makedepends=('cmake' 'boost' 'eigen' 'flann' 'vtk' 'qhull' 'qt5-base' 'assimp' 'fcl-git'
	'libccd' 'python' 'minizip' 'zlib' 'xerces-c')
optdepends=('lua')
source=("debian-pkg.tar.gz::https://nextcloud.sdu.dk/index.php/s/C9amCp9f2e5jNw7/download")

sha256sums=('f1f6f91c5a7a56f9b62ab6d6952436127c481441ff2810424030db7a6da9ae8c' )

build() {
	cd ${srcdir}/RobWork-debian-pkg

	cmake -B${srcdir}/build \
		-DCMAKE_BUILD_TYPE=Release \

	cmake --build ${srcdir}/build
}

package() {
	cmake --install ${srcdir}/build --prefix ${pkgdir}/usr
}
