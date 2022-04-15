# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Tang Ziya <tcztzy@gmail.com>

pkgbase=python-manimgl
_name=manimgl
pkgname=python-$_name
pkgver=1.4.1
pkgrel=2
pkgdesc="An animation engine for explanatory math videos"
arch=('any')
url="https://github.com/3b1b/manim"
license=('MIT' 'custom')
depends=(
    'python-argparse'
    'python-colour'
    'python-numpy'
    'python-pillow'
    'python-progressbar'
    'python-scipy'
    'python-tqdm'
    'opencv'
    'python-cairo'
    'cairo'
    'ffmpeg'
    'sox'
    # AUR package
    'python-pydub'
)
optdepends=('texlive-most: latex support')
makedepends=('python-setuptools' 'python-pbr')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
