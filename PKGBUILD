gitname=moviepy
pkgname=python-${gitname}-git
pkgver=284.d4c9c37
pkgrel=1
pkgdesc="Script-based movie editing with python (git version)"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('git' 'python-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv<3.0.0'
	 'python-decorator' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-imageio')
provides=('python-moviepy')
conflicts=('python-moviepy')
source=("git+https://github.com/Zulko/${gitname}.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
	 cd "${srcdir}/${gitname}"
	 python setup.py install --root="${pkgdir}" --optimize=1
}