# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=pagure
pkgver=5.8.1
pkgrel=0.2
pkgdesc="A git-centered forge based on python using pygit2"
arch=("any")
url="https://pagure.io/$pkgname"
license=("GPL2")
_pydeps=('alembic'
         'arrow'
         'bcrypt'
         'binaryornot'
         'bleach'
         'blinker'
         'celery'
         'chardet'
         'cryptography'
         'docutils'
         'flask'
         'flask-wtf'
         'kitchen'
         'markdown'
         'munch'
         'pillow'
         'psutil'
         'pygit2'
         'openid'
         'openid-cla'
         'openid-teams'
         'redis'
         'requests'
         'six'
         'sqlalchemy'
         # 'straight-plugin' py2?
         'wtforms')
depends=('git'
         'libffi'
         'libgit2'
         'libjpeg'
         'python'
         "${_pydeps[@]/#/python-}"
         'redis')
makedepends=('python-setuptools')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5e150bad0a3f932d265cb59d46c8b6a532be0f757aab695a8c37df3f5f4db687')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
