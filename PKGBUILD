# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=VK-Scraper
pkgname=vk-scraper-git
pkgver=1.3.0.r2.636e183
pkgrel=1
pkgdesc="Scrapes a VK user's photos"
arch=('any')
url='https://github.com/vanyasem/VK-Scraper'
license=('GPL3')
depends=('python-vk_api' 'python' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools')
provides=('vk-scraper')
conflicts=('vk-scraper')
source=('git://github.com/vanyasem/VK-Scraper')
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
