# Maintainer: Your Name <youremail@domain.com>
pkgname=ricerous-git
pkgver=r55.4b6a828
pkgrel=1
pkgdesc="The diary of ricers."
arch=(any)
url="https://github.com/nixers-projects/ricerous"
license=('GPL')
depends=('python2-kivy' 'python2-setuptools')
makedepends=('git')
source=("ricerous::git+https://github.com/nixers-projects/ricerous")
md5sums=('SKIP')
options=(!emptydirs)

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
