# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-espnet-tts-frontend-git
pkgver=0.0.3.r47
pkgrel=1
pkgdesc='A tools collection of text frontend for ESPnet tts recipes'
arch=('any')
url='https://github.com/espnet/espnet_tts_frontend'
license=('Apache 2.0')
depends=('python>=3.7' 'python-unidecode')
makedepends=('git' 'python-setuptools')
provides=('python-espnet-tts-frontend')
conflicts=("python-espnet-tts-frontend")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s.r%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)"
}


build() {
    cd "${pkgname}"
    python setup.py build
}


package() {
    cd "${pkgname}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

