# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=speechmatics-voice
pkgname=python-$_name
pkgver=0.2.8
pkgrel=1
pkgdesc='Speechmatics Voice Agent Python client for Real-Time API.'
arch=('any')
_repo='https://github.com/speechmatics/speechmatics-python-sdk'
url="$_repo/tree/main/sdk/voice"
license=('MIT')
depends=('python' 'python-speechmatics-rt' 'python-pydantic' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-certifi' 'python-onnxruntime') # 'python-transformers'
optdepends=('python-certifi: smart' 'python-onnxruntime: smart' 'python-transformers: smart')
source=("$_repo/archive/refs/tags/${_name//speechmatics-/}/v$pkgver.tar.gz"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/languages/cmn_hans_cn_000328.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/languages/de_de_000675.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/languages/es_419_000896.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/languages/fr_fr_000378.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/languages/he_il_000432.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/languages/ja_jp_000595.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/languages/th_th_000208.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/smart_turn/01_false_16kHz.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/smart_turn/02_false_16kHz.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/smart_turn/03_true_16kHz.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/audio_01_16kHz.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/audio_02_8kHz.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/audio_03_16kHz.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/audio_04_16kHz.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/audio_05_16kHz.wav"
        "$_repo/raw/refs/tags/${_name//speechmatics-/}/v$pkgver/tests/${_name//speechmatics-/}/assets/audio_06_16kHz.wav")
sha256sums=('92bb08e0e25e3928261ef814eba3a68898a778587e1f1679d7fd6d8f3b2a90f2'
            'f04d0429ccbdf4b69f6d5bb4893b91fc04a65809d863224218b3ef8c955064a1'
            'fe2b28fa4bf8123fa5494cb4cfdbed535899048c892fe14033424f443bdd7330'
            '56eab3b040e2a9de740d0e70ea51ebd37637cb30b20709c9b8e454ef3d326782'
            '27e79762c5577bfd21fb874bd78b4c8c8659b1413ae892c6ee72ed08c5b4f20f'
            'd4f64da0b3ffa3a979e97a0b354a884f6a77029f8ab3546d95537a37cf460059'
            '939884e5d7c23ce68bb310ac3df01073554a9da28470ed976519dc0b241a20db'
            '8ca5846de9f877921737ad8a6f01f7c39e8df8f9ef67ca22596b39b045d1f1a3'
            'ff2f716f2b806a7f4a6e10860a5547885d69b26dd000468d221f57fa5b1aa086'
            '442f8ae1d0a1f714df4610d8765106ec602f5c77a26169650b33e7b73293cbb8'
            '4e3721e260f59673de77eb795d683a591f0df23919afb9072f32eebabee9ecc4'
            '93dbce77fcc7457c87e0559dd7501a2f24861239466f90664decdb6d465818e2'
            '4e93958ef0a3bf812e176a4003d942cdeceb1340583a79d120fa54c430293bb9'
            'ef18686db712ccb8d7714e86358f64490da3eaa6ff7ed6e090070169d87b6ed2'
            'e4d8e833dec170233f9889874d529c06074be6bd0291dd923ec463315230fab5'
            '5218b4caa8d3f853e79a9f6dbf341d0ab9a0771b9a45f996d4a3b07fd7607bdb'
            'b5cb9da6ed4aa3e6c2fb16f94840466d4ce33c180eb715724d11c85cb266f30b')

prepare() {
  cp -f "$srcdir"/cmn_hans_cn_000328.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/languages/cmn_hans_cn_000328.wav
  cp -f "$srcdir"/de_de_000675.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/languages/de_de_000675.wav
  cp -f "$srcdir"/es_419_000896.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/languages/es_419_000896.wav
  cp -f "$srcdir"/fr_fr_000378.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/languages/fr_fr_000378.wav
  cp -f "$srcdir"/he_il_000432.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/languages/he_il_000432.wav
  cp -f "$srcdir"/ja_jp_000595.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/languages/ja_jp_000595.wav
  cp -f "$srcdir"/th_th_000208.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/languages/th_th_000208.wav
  cp -f "$srcdir"/01_false_16kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/smart_turn/01_false_16kHz.wav
  cp -f "$srcdir"/02_false_16kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/smart_turn/02_false_16kHz.wav
  cp -f "$srcdir"/03_true_16kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/smart_turn/03_true_16kHz.wav
  cp -f "$srcdir"/audio_01_16kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/audio_01_16kHz.wav
  cp -f "$srcdir"/audio_02_8kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/audio_02_8kHz.wav
  cp -f "$srcdir"/audio_03_16kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/audio_03_16kHz.wav
  cp -f "$srcdir"/audio_04_16kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/audio_04_16kHz.wav
  cp -f "$srcdir"/audio_05_16kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/audio_05_16kHz.wav
  cp -f "$srcdir"/audio_06_16kHz.wav "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/tests/${_name//speechmatics-/}/assets/audio_06_16kHz.wav
  cd "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/sdk/${_name//speechmatics-/}
  sed -i "s/0.0.0/$pkgver/" speechmatics/voice/__init__.py
}

build() {
  cd "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/sdk/${_name//speechmatics-/}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/sdk/${_name//speechmatics-/}
  # Skip the tests until python-transformers fixed
  # PYTHONPATH=$PWD pytest "${pytest_options[@]}" ../../tests/${_name//speechmatics-/}
}

package() {
  cd "$srcdir"/${_name//-voice/}-python-sdk-${_name//speechmatics-/}-v$pkgver/sdk/${_name//speechmatics-/}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
