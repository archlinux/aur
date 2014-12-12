_pkgname=moviepy
pkgname=python2-${_pkgname}
pkgver=0.2.2
pkgrel=1
pkgdesc="Script-based movie editing with python2"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('python2-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv'
	 'python2-decorator' 'python2-numpy' 'python2-pillow' 'python2-pygame'
	 'python2-scikit-image' 'python2-scipy' 'python-tqdm')
provides=('python2-moviepy-git')
conflicts=('python2-moviepy-git')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('7211b27da68a5cd21dd7d1f03131181287a82060fbccdbb72b22337bcc204186')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python2 setup.py install --root="${pkgdir}" --optimize=1
}
