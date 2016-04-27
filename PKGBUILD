_pkgname=moviepy
pkgname=python-${_pkgname}
pkgver=0.2.2.11
pkgrel=5
pkgdesc="Script-based movie editing with python"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('python-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv'
	 'python-decorator' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-imageio' 'python-pygame')
provides=('python-moviepy-git')
conflicts=('python-moviepy-git')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('d937d817e534efc54eaee2fc4c0e70b48fcd81e1528cd6425f22178704681dc3')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python setup.py install --root="${pkgdir}" --optimize=1
}