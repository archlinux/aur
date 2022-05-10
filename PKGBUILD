# Maintainer: Elijah Gregg <lovetocode999 at tilde dot team>
pkgname=termpdf.py-git
pkgver=r0.ge7bd082
pkgrel=1
pkgdesc="A graphical pdf (and epub, cbz, ...) reader that works inside the kitty terminal"
arch=("x86_64")
url="https://github.com/dsanson/termpdf.py"
license=("MIT")
makedepends=("python-setuptools" "git")
depends=("python" "python-pymupdf" "python-pdfrw" "python-pyperclip"
         "python-pybtex" "python-pynvim" "python-roman" "python-pagelabels")
provides=("termpdf.py")
conflicts=("termpdf.py")
source=("git+https://github.com/dsanson/termpdf.py.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/termpdf.py"

    printf 'r%s.g%s' "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/termpdf.py"
    python setup.py build
}

package() {
    cd "$srcdir/termpdf.py"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
