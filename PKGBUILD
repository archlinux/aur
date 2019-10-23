# Maintainer: gee

pkgname=ialauncher-git
pkgver=r45.291048f
pkgrel=1
pkgdesc='Play all of the Internet Archive’s MS-DOS games offline!'
arch=('x86_64')
url='https://github.com/rtts/ialauncher'
license=('GPL3')
depends=('dosbox' 'webkit2gtk' 'python' 'python-natsort' 'gst-plugins-bad'
         'python-jinja')
source=('ialauncher::git+https://github.com/rtts/ialauncher.git')
sha256sums=('SKIP')

pkgver() {
  cd ialauncher

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ialauncher

  python setup.py build
}

package() {
  cd ialauncher

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
