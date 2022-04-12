# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-autosub3
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc='Auto-generates subtitles for any video or audio file, upgrades original autosub and adds support for windows.'
arch=(any)
url=https://pypi.org/project/autosub3
license=(MIT)
depends=('python' 'ffmpeg' 'python-google-api-python-client' 'python-progressbar' 'python-pysrt' 'python-requests' 'python-six')
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a8e937384ed9b7b1f3f08e1ec77885cb75089afeeec47687ff627fd6a49cc254')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
