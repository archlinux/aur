# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Tang Ziya <tcztzy@gmail.com>

_name=manim
pkgname=python-manimgl
pkgver=1.7.2
pkgrel=3
pkgdesc="Animation engine for explanatory math videos"
arch=(any)
url="https://github.com/3b1b/manim"
license=('MIT')
depends=('ffmpeg'
         'ipython>=8.18.0'
         'texlive-core'
         'python>=3.12'
         'python-appdirs'
         'python-colour'
         'python-fonttools'
         'python-matplotlib'
         'python-numpy'
         'python-opengl'
         'python-pillow'
         'python-pygments'
         'python-pyperclip'
         'python-pyyaml'
         'python-rich'
         'python-scipy'
         'python-sympy'
         'python-tqdm'
         'python-validators'
         # AUR packages
         'python-addict'
         'python-diskcache'
         'python-mapbox-earcut'
         'python-moderngl'
         'python-moderngl-window'
         'python-skia-pathops'
         'python-pydub'
         'python-pyrr'
         'python-screeninfo'
         'python-manimpango>=0.6.0'
         'python-isosurfaces'
         'python-svgelements>=1.8.1')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('680a4f8d09e1d97519a8c072f201468508a32c7f43a5f80bc33b0659dfd50a19c30984fc6bc781b139930df6673e2719d603af7e87665447efd522464611238c')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
