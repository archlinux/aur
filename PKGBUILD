pkgname=python-wandb
pkgver=0.14.0
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
    'https://files.pythonhosted.org/packages/10/b0/314ec38aa9ea79e98e755059369c39cf7cec9b3720fdfd1fd082c28d754b/wandb-0.14.0.tar.gz'
)
sha256sums=(
    '2f17b570ca26619ca35bd4ea9628961aae1d91cad56cf26becb917854ea055d3'
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

