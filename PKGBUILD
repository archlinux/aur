# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=sysbro
pkgver=0.7
pkgrel=1
pkgdesc="系统小助手"
arch=('x86_64')
url="https://github.com/rekols/sysbro"
license=('GPL')
groups=()
depends=(
    'dtkwidget'
    'hicolor-icon-theme'
    )
makedepends=(
    'qt5-base'
    'qt5-tools'
    'gcc'
)
checkdepends=()
#source=("git@github.com:rekols/sysbro.git")
#md5sums=('SKIP')


build() {
    rm -rf sysbro
    git clone "$url"
    cd sysbro && mkdir build && cd build
	cmake .. && make -j2
}

package() {
	cd sysbro/build
	make DESTDIR="$pkgdir/" install
}


