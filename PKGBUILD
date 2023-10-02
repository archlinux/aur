# Contributor: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Pablo Moyano (p4block)

pkgname=glmviz-git
pkgver=1.0
pkgrel=2
pkgdesc='High framerate, dB correct OpenGL music visualizer with FiFo buffers and PulseAudio input support'
arch=('any')
url='https://github.com/hannesha/GLMViz'
license=('GPL3')
depends=('glm' 'fftw' 'glfw-x11' 'libconfig')
makedepends=('git')
optdepends=(pulseaudio)
source=("git+https://github.com/hannesha/GLMViz.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/GLMViz"
        mkdir -p build
        cd build
        cmake ..
}

package() {
	cd "${srcdir}/GLMViz/build"
	make DESTDIR=${pkgdir} install
}
