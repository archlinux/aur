# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-espnet-git
pkgver=202207
pkgrel=1
pkgdesc='End-to-End Speech Processing Toolkit Python Package'
arch=('any')
url='https://github.com/espnet/espnet'
license=('Apache 2.0')
depends=('python>=3.7'
        'python-numpy'
        'python-pytorch'
        'python-soundfile'
        'python-typeguard'
        'python-editdistance'
        'python-librosa'
        'tensorboard'
        'python-h5py'
        'python-nltk'
        'python-regex'
        'python-inflect'
        'python-jaconv'
        'python-pytorch-complex-git'
        'python-pytorch-wpe-git'
        'python-g2p-git'
        'python-kaldiio-git'
        'python-sentencepiece-git'
        'python-wandb-git'
        'python-espnet-tts-frontend-git'
        'python-ctc-segmentation-git'
        'python-humanfriendly'
        'python-jamo-git')
optdepends=('sox: convert audio files'
            'python-espnet-model-zoo-git: pretrained models')
makedepends=('git' 'python-setuptools')
provides=('python-espnet')
conflicts=("python-espnet")
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

