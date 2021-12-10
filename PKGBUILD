# Maintainer: Joakim Hellsén <tlovinator@gmail.com>

pkgname=python-dhooks-git
pkgver=v1.1.4.r243.cdd5f3f
pkgrel=1
pkgdesc='An (a)sync wrapper for discord webhooks'
arch=('any')
url='https://github.com/kyb3r/dhooks/'
license=('MIT')
depends=('python' 'python-aiohttp' 'python-requests')
makedepends=('git' 'python-setuptools')
checkdepends=()
provides=("python-dhooks")
conflicts=("python-dhooks")
source=('git+https://github.com/kyb3r/dhooks.git')
md5sums=('SKIP')

pkgver() {
  cd dhooks
  printf "v%s.r%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dhooks
  python setup.py build
}

package() {
  cd dhooks
  python setup.py install --root="$pkgdir" --optimize=1
}
