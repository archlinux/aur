# Maintainer: slapelachie <slapelachie@gmail.com>

pkgname=kadai-git
pkgver=1.0.0rc1.r0.22acde3
pkgrel=1
pkgdesc="Simple theme manager for tiling window managers."
arch=('i686' 'x86_64')
url="https://github.com/slapelachie/kadai"
license=('GPL2')
depends=('python')
makedepends=('git' 'python-setuptools')
source=(git+https://github.com/slapelachie/kadai.git)
md5sums=(SKIP)

pkgver() {
        cd "kadai"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "${srcdir}/kadai"

        python setup.py build
}

package() {
          cd "${srcdir}/kadai"

          python setup.py install --optimize=1 --root="${pkgdir}"/
}
