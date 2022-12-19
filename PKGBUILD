# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="spleeter2"
pkgver=2.3.0
pkgrel=2
pkgdesc="The Deezer source separation library with pretrained models based on tensorflow."
url="https://research.deezer.com/projects/spleeter.html"
license=("MIT")
arch=("any")
provides=("spleeter")
conflicts=("spleeter")
depends=("tensorflow>=2.5.0"
         "python>=3.7.1"
         "python-ffmpeg"
         "python-h2"
         "python-httpx"
         "python-importlib-metadata"
         "python-importlib-resources"
         "python-librosa"
         "python-llvmlite"
         "python-norbert"
         "python-numpy"
         "python-pandas"
         "python-protobuf"
         "python-tensorflow"
         "python-typer")
makedepends=("python-poetry" "python-build" "python-installer" "python-wheel")
optdepends=("python-musdb: source separation evaluation"
            "python-museval: source separation evaluation")
options=("!strip")
source=("spleeter-$pkgver.tar.gz::https://github.com/deezer/spleeter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fbe3bfd6a7ad79ebe77c14e3f24df9ab7b502c2f47e41069ff00f99b4e50a576')
install="$pkgname.install"

build(){
 cd "spleeter-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "spleeter-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
