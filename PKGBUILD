# Maintainer: KlipperKyle <kyleterrien at gmail dot com>
# Former maintainer: speps <speps at aur dot archlinux dot org>

pkgname=python-pygame-hg
pkgver=r3449.d61ea8eabd56
pkgrel=2
pkgdesc="Python game library"
arch=(i686 x86_64)
url="http://pygame.org/"
license=('LGPL')
depends=('python' 'libjpeg-turbo' 'sdl_ttf'
         'sdl_image' 'sdl_mixer' 'portmidi')
makedepends=('mercurial' 'python-setuptools')
provides=('python-pygame')
conflicts=('python-pygame')
source=("$pkgname::hg+https://bitbucket.org/pygame/pygame")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $pkgname
  python config.py -auto
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --prefix=/usr \
                          --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
