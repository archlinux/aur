pkgname=python-wandb
pkgver=0.12.9
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
    'https://files.pythonhosted.org/packages/4d/96/1dbe1a178d353133c493f6394d31e82f69442d48901209d2fab8269e7f94/wandb-0.12.9.tar.gz'
)
sha256sums=(
    '2aad811ff0151be62ffdf49d5fcd027c222d2861b5f459134e778d1a7eee6a1b'
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

