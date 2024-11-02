# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="coqui-tts"
_pkgname="${pkgname/-/_}"
pkgver=0.24.2
pkgrel=1
pkgdesc="Deep learning for Text to Speech"
url="https://github.com/idiap/coqui-ai-TTS"
license=("MPL2")
arch=("any")
provides=("tts" "python-tts")
conflicts=("python-tts" "tts")
replaces=("python-tts" "tts")
depends=("cython0"
         "python"
         "python-numpy"
         "python-scipy"
         "python-pytorch"
         "python-torchaudio"
         "python-soundfile"
         "python-librosa"
         "python-numba"
         "python-inflect"
         "python-tqdm"
         "python-anyascii"
         "python-yaml"
         "python-fsspec"
         "python-aiohttp"
         "python-packaging"
         "python-flask"
         "python-pysbd"
         "python-soxr"
         "python-coqpit"
         "python-coqui-trainer"
         )
makedepends=("python-build" "python-installer" "python-wheel")
optdepends=("python-umap-learn: for notebooks"
            "python-pandas: for notebooks"
            "python-matplotlib: for training"
            "python-coqui-trainer: for training"
            "python-coqpit: for configuration"
            "python-gruut: for german, spanish, french"
            "python-jieba: for chinese"
            "pypinyin: for chinese"
            "python-mecab: for japanese"
            "python-unidic-lite: for japanese"
            "python-jamo-git: for korean"
            "python-nltk: for korean"
            #"python-g2pkk: for korean"
            #"python-bangla: for bangla"
            #"python-bnnumerizer: for bangla"
            #"python-bnunicodenormalizer: for bangla"
            #"python-k_diffusion: for tortoise"
            "python-einops: for tortoise"
            "python-transformers: for tortoise"
)
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('d2766b70fd1b5d30bdc5d5931c0190da43027da9cf59d128319961f786ca565b52a60b049784e10171609099e915e695dd75fb595cfa945809f99c9568fda14c')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
