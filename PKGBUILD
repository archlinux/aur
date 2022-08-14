pkgname=python-wandb
pkgver=0.13.1
pkgrel=1
pkgdesc='Weights and Biases - organize and analyze machine learning experiments'
arch=('any')
url='https://wandb.ai'
license=('MIT')
depends=('python>=3.7' 'python-gitpython' 'python-dateutil' 'python-requests' 'python-click' 'python-promise' 'python-shortuuid' 'python-six' 'python-watchdog' 'python-psutil' 'python-sentry_sdk' 'python-protobuf' 'python-pyaml' 'python-docker-pycreds' 'python-yaspin')
makedepends=('git' 'python-setuptools')
provides=('python-wandb')
conflicts=("python-wandb-git")
source=(
    'https://files.pythonhosted.org/packages/27/a9/ae98cb4b90f52121023d675f53f40dcc9c5aa056c27fb425e4d61f6be67a/wandb-0.13.1.tar.gz'
)
sha256sums=(
    'd362c408c9214722c43678aed3b807e0ba80d4752c70a32854179d926b8ff2ac'
)

build() {
    cd "wandb-$pkgver"
    python setup.py build
}


package() {
    cd "wandb-$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

