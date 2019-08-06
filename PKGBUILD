# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=yuru-yuri
pkgname=manga-downloader-git
_gitname=manga-py
pkgver=0.r1154.73daf97
pkgrel=1
pkgdesc='cli manga downloader'
url='https://github.com/yuru-yuri/manga-py.git'
arch=('any')
license=('MIT')
depends=('python-lxml' 'python-cssselect' 'python-requests' 'python-pillow' 'python-pycryptodome' 'python-cloudscraper' 'python-loguru' 'python-selenium' 'python-pyexecjs' 'python-packaging' 'python' 'python-urllib3' 'python2-progressbar' 'python-html-purifier' 'python-numpy')
makedepends=('git')
provides=('manga-downloader')

source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root=$pkgdir
}
