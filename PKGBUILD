# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Tang Ziya <tcztzy@gmail.com>

_name=manim
pkgname=python-manimgl
pkgver=1.7.1
pkgrel=1
pkgdesc="Animation engine for explanatory math videos"
arch=(any)
url="https://github.com/3b1b/manim"
license=('MIT')
depends=('ffmpeg'
         'ipython>=8.18.0'
         'texlive-core'
         'python>=3.12'
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
b2sums=('7021b20445ef9fdd2ffc718cd0bcc27cd5f0c9d8be7d03fc4fdbd854ff6a53fe4c6a1bb3e04b14a3eae8f169b2a2f18f3a091c32ff175ffd045b7033c0a96aa6')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
