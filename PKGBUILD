#Maintainer POpolon <popolon @ popolon dot org>

pkgname='betteradbsync'
_module='BetterADBSync'
_src_folder='BetterADBSync-1.4.0'
pkgver='1.4.0'
pkgrel=1
pkgdesc="Better version of adb-sync for Python3"
url="https://github.com/jb2170/better-adb-sync/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/9f/de/fa3cdea43143f65138ee83dc5636310e4c1b809db3933bd2fd3dffae60c3/BetterADBSync-1.4.0.tar.gz")
sha256sums=('cfa13c81ac88b451294fd1888bb2c0679c48a6d372507fc8063ea625f7e6ce82')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
