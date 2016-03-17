# Maintainer: Danilo Bargen aur ât dbrgn döt ch
pkgname=upscrot
pkgver=1.0.0b1
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
sha256sums=('100a8b34ec4b5cd8218d97d2a3bf2361a54710a3117f3f5441ede2085c6148e2')

package() {
  cd "$srcdir"
  pip install --root "$pkgdir" $_wheel
}
