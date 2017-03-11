# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-gradergen-git
pkgver=r174.4f2d491
pkgrel=1
pkgdesc="A tool meant to generate graders and templates files of olympic problems"
arch=('any')
url="https://github.com/walypala23/gradergen"
license=('MIT')
depends=('python' 'python-yaml')
provides=('python-gradergen')
options=(!emptydirs)
source=("git+https://github.com/walypala23/gradergen.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/gradergen"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/gradergen"
    python setup.py install --root="$pkgdir/" --optimize=1
}
