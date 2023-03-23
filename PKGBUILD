# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname='subtitld'
pkgver=23.02
pkgrel=1
pkgdesc='Subtitld: An open source software to create, edit and transcribe subtitles'
arch=('x86_64')
url='https://www.subtitld.org/'
license=('GPLv3')
depends=('pyside6' 'python-pyffms2' 'python-mpv' 
         'python-opengl' 'python-numpy' 'python-cffi' 'python-requests' 'python-pycaption'
         'python-pysubs2' 'python-cleantext' 'python-translate' 'python-speechrecognition'
         'python-docx' 'python-charset-normalizer' 'python-google-api-python-client'
         'python-pysrt' 'python-certifi')
makedepends=('git' 'python-setuptools')
source=("https://gitlab.com/jonata/$pkgname/-/archive/$pkgver/${pkgname}-${pkgver}.tar.gz")
sha256sums=('83381cd697fa4355bc0d4689dfc063efe9ec41c8e177b8e55e35b7b4e6af3ace')

build() {
  cd ${pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}/
  python setup.py install --root="$pkgdir" --optimize=1
}
