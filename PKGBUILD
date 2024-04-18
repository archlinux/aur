# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

pkgbase=manimce
pkgname=manim
pkgver=0.18.0.post0
pkgrel=1
pkgdesc="Animation engine for explanatory math videos (community edition)."

arch=("any")
license=("MIT" "custom")
url="https://github.com/ManimCommunity/manim"

source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('91d28837725edfc573588e73a4183957e07351ecb9a70b0ec1e205673b072dc5e91287977372a76f359e55d934393f3655ceeda136cd230a255b06b3bc78d317')

conflicts=("python-manimlib")

depends=(
    "ffmpeg"
    "python"
    "python-cairo"
    "python-click"
    "python-click-default-group"
    "python-colour"
    "python-decorator"
    "python-google-api-core"
    "python-importlib-metadata"
    "python-numpy"
    "python-pillow"
    "python-pygments"
    "python-requests"
    "python-rich"
    "python-scipy"
    "python-setuptools"
    "python-tqdm"
    "python-watchdog"
    "python-networkx"
    # Aur dependencies
    "python-cloup"
    "python-backports.cached_property"
    "python-glcontext"
    "python-isosurfaces"
    "python-manimpango"
    "python-mapbox-earcut"
    "python-moderngl"
    "python-moderngl-window"
    "python-pydub"
    "python-screeninfo"
    "python-skia-pathops"
    "python-srt"
    "python-svgelements"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
optdepends=(
    "jupyterlab: Jupyter something"
    "python-grpcio-tools: WebGL renderer"
    "texlive-core: LaTeX support"
)

build () {
    cd "$srcdir/$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 LICENSE.community "$pkgdir/usr/share/licenses/$pkgname/LICENSE.community"
}
