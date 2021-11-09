pkgname=python-wandb
pkgver=0.12.6
pkgrel=1
pkgdesc='Weights and Biases - organize and analyze machine learning experiments'
arch=('any')
url='https://wandb.ai'
license=('MIT')
depends=('python>=3.7' 'python-gitpython' 'python-dateutil' 'python-requests' 'python-click' 'python-promise' 'python-shortuuid' 'python-six' 'python-watchdog' 'python-psutil' 'python-sentry_sdk' 'python-protobuf' 'python-pyaml' 'python-configparser' 'python-docker-pycreds' 'python-subprocess32' 'python-yaspin')
makedepends=('git' 'python-setuptools')
provides=('python-wandb')
conflicts=("python-wandb-git")
source=(
    "https://files.pythonhosted.org/packages/fd/8a/1c34adf41a634a24c26e17f070abebb3ca74026915d265b9e43ecf233994/wandb-$pkgver.tar.gz"
)
sha256sums=(
    'ad946efc269b25a36b500a831b6bf9ae26b4a695add55e4a53f5b7220e03b177'
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

