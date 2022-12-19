# Maintainer: Aleksana QWQ <me@aleksana.moe>

pkgname=hyfetch
pkgver=1.4.5
pkgrel=1
pkgdesc="Neofetch with LGBTQ pride flags."
arch=('any')
url='https://github.com/hykilpikonna/hyfetch'
license=('MIT')
depends=('python' 'python-setuptools' 'python-typing_extensions')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd ${pkgname}
  chmod +x neofetch
  chmod +x hyfetch/scripts/neowofetch
  /usr/bin/python3 setup.py build
}

package() {
  cd ${pkgname}
  chmod +x neofetch
  chmod +x hyfetch/scripts/neowofetch
  /usr/bin/python3 setup.py install --root="$pkgdir" --optimize=1
}
