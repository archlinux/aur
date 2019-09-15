pkgbase='python-moviepy'
pkgname=('python-moviepy')
_module='moviepy'
pkgver='1.0.0'
pkgrel=1
pkgdesc="Video editing with Python"
url="https://zulko.github.io/moviepy/"
depends=('python' 'ffmpeg' 'imagemagick' 'opencv'
         'python-decorator' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-imageio')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('16c7ffca23d90c76dd7b163f648c8166dfd589b7c180b8ff75aa327ae0a2fc6d')

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
