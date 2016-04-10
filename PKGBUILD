_pkgname=moviepy
pkgname=python-${_pkgname}
pkgver=0.2.2
pkgrel=4
pkgdesc="Script-based movie editing with python"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('python-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv<3.0.0'
	 'python-decorator' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-imageio' 'python-pygame')
provides=('python-moviepy-git')
conflicts=('python-moviepy-git')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('7211b27da68a5cd21dd7d1f03131181287a82060fbccdbb72b22337bcc204186')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python setup.py install --root="${pkgdir}" --optimize=1
}