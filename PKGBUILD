# Maintainer: dylanaraps <dylan.araps@gmail.com>
# AUR Package Maintainer: ov3rl0w <dalcjor@libmail.eu>

pkgname=pywal-git
pkgver=3.3.0.r65.gc18f401
pkgrel=1
pkgdesc="Generate and change color-schemes on the fly."
arch=('i686' 'x86_64')
url="https://github.com/dylanaraps/pywal"
license=('MIT')
depends=('python')
makedepends=('git' 'sudo' 'python-pip')
source=(git+https://github.com/dylanaraps/pywal)
md5sums=(SKIP)

pkgver() {
         cd "pywal"
         git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "${srcdir}/pywal"

        python setup.py build
}

package() {
          cd "${srcdir}/pywal"

          python setup.py install --optimize=1 --root="${pkgdir}"/
}
