# Maintainer: Your Name <your.email@example.com>
pkgname=org
pkgver=0.0.1
pkgrel=1
pkgdesc="Suckless second brain - a simple terminal note-taking and task management app"
arch=('any')
url="https://github.com/benjaminingreens/borg"
license=('MIT')  # Change to your project's license
depends=('python' 'python-setuptools')
makedepends=('git')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')  # You can update this with the actual checksum

build() {
  cd "$srcdir/borg"
  python setup.py build
}

package() {
  cd "$srcdir/borg"
  python setup.py install --root="$pkgdir/" --optimize=1
}
