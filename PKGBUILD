# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=vk_api
pkgname=(python-vk_api-git python2-vk_api-git)
pkgver=9.3.r1.ea556a5
pkgrel=3
pkgdesc='Module for writing scripts for vk.com (vkontakte)'
arch=('any')
url='https://github.com/python273/vk_api'
license=('APACHE')
depends=()
makedepends=('python-setuptools')
source=('git://github.com/python273/vk_api')
md5sums=('SKIP')

pkgver() {
  cd $appname
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

package_python-vk_api-git() {
  depends=('python' 'python-requests' 'python-beautifulsoup4')
  cd "$srcdir/$appname"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-vk_api-git() {
  depends=('python2' 'python2-requests' 'python2-enum34' 'python2-beautifulsoup4')
  cd "$srcdir/$appname"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
