# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.1.0
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit>3.0.0'
         'python-babelfish>=0.5.2'
         'python-enzyme>=0.4.1'
         'python-beautifulsoup4>=4.4.0'
         'python-requests>=2.0'
         'python-click>=4.0'
         'python-dogpile.cache>=0.6.0'
         'python-stevedore>=1.20.0'
         'python-chardet>=2.3.0'
         'python-pysrt>=1.0.1'
         'python-six>=1.9.0'
         'python-appdirs>=1.3'
         'python-rarfile>=2.7'
         'python-pytz>=2012c')
makedepends=('git'
             'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('bd1193a10f2229ef04883977817930ae')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/licenses/subliminal"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/subliminal/"
}
