# Maintainer: Michael <x30827pos@gmail.com>
pkgname=git2md-git
reponame=git2md
pkgver=1.1.3.r0.g$(git rev-parse --short HEAD)
pkgrel=1
pkgdesc="Convert Git repository contents to Markdown format"
arch=('any')
url="https://github.com/xpos587/$reponame"
license=('MIT')
depends=('python' 'python-pathspec')
makedepends=('git' 'python-pip' 'python-setuptools')
provides=("python-$reponame")
conflicts=("python-$reponame")
source=("git+https://github.com/xpos587/$reponame.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$reponame"
    python setup.py build
}

package() {
    cd "$srcdir/$reponame"
    python setup.py install --root="$pkgdir/" --optimize=1

    pip install --root="$pkgdir" nbconvert nbformat pymupdf4llm
}

