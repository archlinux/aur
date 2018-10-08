# Maintainer: Robin Broda <robin at broda dot me>

pkgname=glava
pkgver=1.5.3
pkgrel=1
pkgdesc='OpenGL audio spectrum visualizer'
arch=('x86_64')
url='https://github.com/wacossusca34/glava'
license=('GPL3')
depends=('x-server' 'pulseaudio' 'libxext' 'libxcomposite' 'libxrender')
makedepends=('git' 'python')
source=("git+https://github.com/wacossusca34/glava#tag=v${pkgver}"
        'git+https://github.com/Dav1dde/glad')
md5sums=('SKIP'
         'SKIP')

prepare() {
	cd "${pkgname}"

	git submodule init
	git config submodule.glad.url "${srcdir}/glad"
	git submodule update
}

build() {
	cd "${pkgname}"

	make
}

package() {
	cd "${pkgname}"

	make DESTDIR="${pkgdir}/" install
}
