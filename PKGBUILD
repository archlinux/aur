pkgname=python-wandb
pkgver=0.15.11
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
    'https://files.pythonhosted.org/packages/97/a8/899ca2a103648f8ffe6f4f039c2a18d7d49687535167355f0f89b72e47d2/wandb-0.15.11.tar.gz'
)
sha256sums=(
    'd686ddb602891b8c63b5a8fffd7585d43ca441025cea2ee0bb01d06e35bfbdb1'
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

