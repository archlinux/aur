pkgname=python-wandb
pkgver=0.16.2
pkgrel=1
pkgdesc='Weights and Biases - organize and analyze machine learning experiments'
arch=('any')
url='https://wandb.ai'
license=('MIT')
depends=(
    'python-appdirs'
    'python-click'
    'python-docker-pycreds'
    'python-gitpython'
    'python-protobuf'
    'python-psutil'
    'python-pyaml'
    'python-requests'
    'python-sentry_sdk'
    'python-setproctitle'
)
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-installer')
provides=('python-wandb')
conflicts=("python-wandb-git")
source=(
    'https://files.pythonhosted.org/packages/ba/83/3392af6af887b85b5f52ddc3a42e026e6c27637cdfd8705a0b945aba314f/wandb-0.16.2.tar.gz'
)
sha256sums=('e40cd79ea6272fe4762a80b9f47b172e141daeb3b56eb9d1e192ebd10752e64e')

build() {
    cd "wandb-$pkgver"
    python -m build -nw
}


package() {
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        $srcdir/wandb-$pkgver/dist/wandb-$pkgver-*.whl
}

