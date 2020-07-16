# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vaping
pkgver=1.2.0
pkgrel=1
pkgdesc='A healthy alternative to SmokePing'
arch=('any')
url="https://github.com/20c/vaping"
license=('Apache')
depends=('python-click'
         'python-gevent'
         'python-pid'
         'python-daemon'
         'python-whichcraft'
         'python-munge'
         'python-pluginmgr'
         'python-subprocess32')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/20c/vaping/archive/${pkgver}.tar.gz")
sha256sums=('fd824ebf16a1f4f149323f15b2c6924975e1187861def6f4696be9bdffb6fc6f')

prepare(){
  cd "vaping-${pkgver}"
  sed -i "s|,.*||" Ctl/requirements.txt
}

package() {
  cd "vaping-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}