# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=VK-Songs
pkgname=vk-songs-git
pkgver=0.1.1.r1.20268ef
pkgrel=1
pkgdesc='Downloads VK songs'
arch=('any')
url='https://github.com/vanyasem/VK-Songs'
license=('GPL3')
depends=('python-vk_api' 'python' 'python-requests' 'python-pyfiglet' 'python-prompt_toolkit' 'python-colorama' 'python-pathvalidate' 'python-pyinquirer' 'python-magic')
makedepends=('git' 'python-setuptools')
provides=('vk-songs')
conflicts=('vk-songs')
source=('git://github.com/vanyasem/VK-Songs')
md5sums=('SKIP')

pkgver() {
  cd $appname
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

package() {
  cd "$srcdir/$appname"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
