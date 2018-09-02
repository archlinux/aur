# Maintainer: mar77i <mar77i at protonmail dot ch>
# Former maintainer: KlipperKyle <kyleterrien at gmail dot com>
# Former maintainer: speps <speps at aur dot archlinux dot org>

pkgname=python-pygame-git
pkgver=1.9.4.r256.g9e24832d
pkgrel=1
pkgdesc="Python game library"
arch=(i686 x86_64)
url="http://pygame.org/"
license=('LGPL')
depends=('python' 'libjpeg-turbo' 'sdl_ttf'
         'sdl_image' 'sdl_mixer' 'portmidi')
makedepends=('git' 'python-setuptools')
provides=('python-pygame')
conflicts=('python-pygame')
source=("$pkgname::git+https://github.com/pygame/pygame")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --prefix=/usr \
                          --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
