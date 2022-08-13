# Maintainer: Aleksana QWQ <me@aleksana.moe>

pkgname=hyfetch-git
pkgver=1.3.0.r34.g64a997ed
pkgrel=2
pkgdesc="Neofetch with LGBTQ pride flags."
arch=('any')
url='https://github.com/hykilpikonna/hyfetch'
license=('MIT')
depends=('python' 'python-setuptools' 'python-typing_extensions')
makedepends=('git')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')
provides=('hyfetch')
conflicts=('hyfetch')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
