# Maintainer: Nikita Derbenev <nikita.yfh@gmail.com>

pkgname=dark-podval-demo-git
pkgver=r14.a67d8bb
pkgrel=1
pkgdesc="A platformer game written in C++"
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/HaBeBu/dark-podval-demo"
license=('ZLIB')
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
makedepends=('git')
provides=('dark-podval-demo')
source=('git+https://github.com/HaBeBu/dark-podval-demo')
md5sums=('SKIP')

pkgver() {
cd "$srcdir/dark-podval-demo"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cd "$srcdir/dark-podval-demo"
make
}

package() {
cd "$srcdir/dark-podval-demo"
make DESTDIR=${pkgdir} install
}
