# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-underthesea
pkgname=python-underthesea
_name=${pkgname#python-}
pkgver=9.5.0
pkgrel=1
epoch=
pkgdesc="Vietnamese NLP Toolkit"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-beautifulsoup4
    python-charset-normalizer
    python-click
    python-fire
    python-google-auth-oauthlib
    python-joblib
    python-huggingface-hub
    python-librosa
    # python-nltk
    python-numpy
    python-matplotlib
    python-scipy
    # python-scikit-learn
    python-soundfile
    python-regex
    python-requests
    python-openai
    python-pandas
    python-pydub
    python-pygithub
    python-pytorch
    python-tabulate
    python-yaml
    python-tqdm
    # AUR
    python-einops
    python-crfsuite
    python-dm-haiku
    # python-fasttext
    python-jax
    python-playsound
    python-seqeval
    python-optax
    python-transformers
    python-youtube-transcript-api
    python-underthesea-core
)
makedepends=(
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('ad6261e9fa5a26f6314ec283513260f82ac227844a2811c520ee62b6d967a4f4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
