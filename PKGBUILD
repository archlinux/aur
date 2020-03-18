pkgbase='python-moviepy'
pkgname=('python-moviepy')
_module='moviepy'
pkgver='1.0.1'
pkgrel=3
pkgdesc="Video editing with Python"
url="https://zulko.github.io/moviepy/"
depends=('python' 'ffmpeg' 'imagemagick' 'opencv'
         'python-decorator' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-imageio' 'python-proglog')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9d5b0a0e884c0eb92c431baa110e560059720aab15d2ef3e4cba3892c34cf1ed')

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
