pkgname=plasma-runners-tmux
_srcname=krunner-tmux-sessions
pkgver=0.0.6
pkgrel=1
pkgdesc="Searches running tmux sessions and attaches to them"
arch=('i686' 'x86_64')
conflicts=('plasma-runners-tmux')
depends=('tmux' 'krunner')
makedepends=('cmake' 'extra-cmake-modules')
url="https://github.com/janbuchar/krunner-tmux-sessions"
license=('MIT')
source=(https://github.com/janbuchar/krunner-tmux-sessions/archive/${pkgver}.tar.gz)
sha1sums=('5940ec7bbf4a44c4bf1f561a491860034cb4f3e1')

prepare() {
	mkdir -p build
}

build()
{
	cd build

	cmake ../${_srcname}-${pkgver} \
		-DCMAKE_INSTALL_LIBEXECDIR='' \
		-DCMAKE_BUILD_TYPE=Release

	cmake --build .
}

package()
{
	cd build
	DESTDIR=${pkgdir} cmake --install .
}

