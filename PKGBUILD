# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vaping
pkgver=1.3.0
pkgrel=1
pkgdesc='A healthy alternative to SmokePing'
arch=('any')
url="https://github.com/20c/vaping"
license=('Apache')
depends=('python'
         'python-click'
         'python-gevent'
         'python-pid'
         'python-daemon'
         'python-whichcraft'
         'python-munge'
         'python-pluginmgr'
         'python-subprocess32')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/20c/vaping/archive/${pkgver}.tar.gz")
sha256sums=('1d3b166d376a40ce9b582878feaf804ff38a492d8358d1a1934fceddd33b493c')

prepare(){
  cd "vaping-${pkgver}"
  sed -i "s|,.*||" Ctl/requirements.txt
}

package() {
  cd "vaping-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
