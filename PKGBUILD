# Maintainer: Éric Gillet <e+aur5250@linuxw.info>

pkgname=jungle-git
pkgver=1.0.0.r3.gfb63f84
pkgrel=1
epoch=1
pkgdesc="AWS operations by cli should be simpler"
arch=('any')
url='https://github.com/achiku/jungle'
license=('MIT')
depends=('python' 
         'python-boto3'
         'python-botocore'
         'python-click')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/achiku/jungle.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
