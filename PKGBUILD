# Maintainer: Danilo Bargen aur ât dbrgn döt ch
pkgname=upscrot
pkgver=1.0.0b2
pkgrel=1
_wheel="${pkgname}-${pkgver}-py3-none-any.whl"
pkgdesc="Take a screenshot using the Linux scrot command and upload it directly to your SSH server."
arch=('i686' 'x86_64')
url="https://github.com/dbrgn/$pkgname"
license=('GPL')
makedepends=('python' 'python-setuptools' 'python-pip')
depends=('python'
         'python-appdirs'
         'scrot')
provides=('upscrot')
conflicts=('upscrot')
noextract=(${_wheel})
source=("https://pypi.python.org/packages/py3/u/${pkgname}/${_wheel}")
sha256sums=('d04b88f7fc7e93b0a49e5a76d0c4c2f60fad2a943de25d605046f2993680a801')

package() {
  cd "$srcdir"
  pip install --root "$pkgdir" $_wheel
}
