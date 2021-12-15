pkgbase='python-moviepy'
pkgname=('python-moviepy')
_module='moviepy'
pkgver='1.0.3'
pkgrel=4
pkgdesc="Video editing with Python"
url="https://zulko.github.io/moviepy/"
depends=('python' 'ffmpeg' 'opencv'
         'python-decorator' 'python-numpy' 'python-pillow' 'python-tqdm' 'python-imageio' 'python-proglog' 'python-imageio-ffmpeg')
optdepends=('python-scikit-image' 'python-scipy' 'imagemagick')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2884e35d1788077db3ff89e763c5ba7bfddbd7ae9108c9bc809e7ba58fa433f5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
	rm -rfv "tests/"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
