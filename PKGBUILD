# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="coqui-tts"
_pkgname="${pkgname/-/_}"
pkgver=0.24.3
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
b2sums=('137478561940c01f83b14176a8a03a52e0508880d0cf255cff14b516d9eee71724481f872c57c7de3cb57cd926fcb869f8959f4c073050b1f8f76c247f63d82e')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
