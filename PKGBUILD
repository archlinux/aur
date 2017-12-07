_pkgname=moviepy
pkgname=python-${_pkgname}
pkgver=0.2.3.2
pkgrel=1
pkgdesc="Script-based movie editing with python"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('python-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv'
	 'python-decorator' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-imageio')
optdepens=('python-pygame')
provides=('python-moviepy-git')
conflicts=('python-moviepy-git')
source=(https://github.com/Zulko/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('de0a3804125af7f4ff9d2c8b7c800f5d3d56a2fc42df4592b1c8c168ceba4d89')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python setup.py install --root="${pkgdir}" --optimize=1
}
