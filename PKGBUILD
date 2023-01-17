# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname='subtitld'
pkgver=22.10
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
sha256sums=('51228b7520ce843926a799526b419939baed2a487d0bee75a6563a15aa006500')

build() {
  cd ${pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}/
  python setup.py install --root="$pkgdir" --optimize=1
}
