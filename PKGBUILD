# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-lhotse-git
pkgver=1.5.0.dev0+git.08a613a0.clean
pkgrel=1
pkgdesc="Speech and audio data preparation toolkit"
arch=('any')
url='https://github.com/lhotse-speech/lhotse'
license=('Apache 2.0')
depends=('python>=3.7'
         'python-audioread'
         'python-soundfile'
         'python-click'
         'python-cytoolz'
         'python-h5py'
         'python-intervaltree'
         'python-lilcom-git'
         'python-packaging'
         'python-pyaml'
         'python-tqdm'
         'python-torchaudio')
makedepends=('git' 'python-setuptools')
provides=('python-lhotse')
conflicts=("python-lhotse")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s" "$(python setup.py --version)"
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

