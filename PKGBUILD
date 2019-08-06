# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=VeNoMouS
pkgname=python-cloudscraper-git
_gitname=cloudscraper
pkgver=0.r76.f741659
pkgrel=1
pkgdesc='A Python module to bypass Cloudflares anti-bot page.'
url='https://github.com/VeNoMouS/cloudscraper.git'
arch=('any')
license=('MIT')
depends=('python-pyopenssl' 'python-requests' 'python-js2py' 'python-requests-toolbelt' 'python-brotli' 'python' 'nodejs')
makedepends=('git')
provides=('python-cloudscraper')

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
