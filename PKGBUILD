# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Tang Ziya <tcztzy@gmail.com>

_name=manim
pkgname=python-${_name}gl
pkgver=1.6.1
pkgrel=1
pkgdesc="Animation engine for explanatory math videos"
arch=(any)
url="https://github.com/3b1b/manim"
license=('MIT')
depends=(
    'ffmpeg'
    'texlive-core'
    'python'
    'python-colour'
    'python-numpy'
    'python-pillow'
    'python-scipy'
    'python-sympy'
    'python-tqdm'
    'python-matplotlib'
    'python-pygments'
    'python-pyyaml'
    'python-rich'
    'python-validators'
    'ipython'
    'python-opengl'
    # AUR packages
    'python-mapbox-earcut'
    'python-moderngl'
    'python-moderngl-window'
    'python-skia-pathops'
    'python-pydub'
    'python-screeninfo'
    'python-manimpango'
    'python-isosurfaces'
    'python-svgelements'
)
makedepends=(cython python-build python-installer python-wheel)
source=("https://github.com/3b1b/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('424116107f8ba627a9c6de6dc9d475f24479c8e96cb48862da40d6a68d8e0c1e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
