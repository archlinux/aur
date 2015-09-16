# Maintainer: Manu Kumar <m4nukum4r@gmail.com>

pkgname=python-todoist-python-git
pkgver=0.82.a8ac365
pkgrel=1
pkgdesc="todoist-python - The official Todoist Python API library"
arch=('any')
url="https://github.com/Doist/todoist-python.git"
license=('MIT')
conflicts=('')
depends=()
makedepends=('python-setuptools' 'python-pip' 'git')
source=("${pkgname%}::git+https://github.com/Doist/todoist-python")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${pkgname}
        echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    }

package() {
  cd "$srcdir/$pkgname"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

