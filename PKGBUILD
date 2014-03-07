gitname=moviepy
pkgname=python2-${gitname}-git
pkgver=45.deb8a68
pkgrel=1
pkgdesc="Script-based movie editing with python2 (git version)"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('git' 'python2-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv'
	 'python2-decorator' 'python2-numpy' 'python2-pillow' 'python2-pygame'
	 'scikit-image' 'python2-scipy' 'python-tqdm')
provides=('python2-moviepy')
conflicts=('python2-moviepy')
source=("git+https://github.com/Zulko/${gitname}.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
	 cd "${srcdir}/${gitname}"
	 python2 setup.py install --root="${pkgdir}" --optimize=1
}
