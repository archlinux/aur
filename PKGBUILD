# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="coqui-tts"
_pkgname="${pkgname/-/_}"
pkgver=0.27.2
pkgrel=1
pkgdesc="Deep learning for Text to Speech"
url="https://github.com/idiap/coqui-ai-TTS"
license=("MPL2")
arch=("any")
provides=("tts" "python-tts")
conflicts=("python-tts" "tts")
replaces=("python-tts" "tts")
depends=("cython"
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
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
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
b2sums=('cd23d106b566c693fb1258adbe153df09a60581e848147b57ba7e3289821f6cf76aa8f975114c34d93f9714414e5da0981a39064e1ee72c26274e168622ede46')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
