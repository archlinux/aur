# Maintainer: Benawi Adha <echo YmVuYXdpYWRoYUBnbWFpbC5jb20K | base64 -d>
# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=epy-git
pkgver=2022.1.8.r204.c1f9b4e
pkgrel=1
pkgdesc="CLI Ebook Reader"
arch=("any")
url="https://github.com/wustho/epy"
license=("GPL3")
provides=("epy")
conflicts=("epy")
makedepends=('python-setuptools')
source=("git+https://github.com/wustho/epy.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/${pkgname/-git/}"
    printf "%s.r%s.%s" "$(grep -F '__version__ =' epy.py | awk -F\" '{print $2}')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname/-git/}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
