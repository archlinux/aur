# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.2.1
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit>=3.0.0'
         'python-babelfish>=0.6.1'
         'python-enzyme>=0.5.0'
         'python-platformdirs>=3'
         'python-beautifulsoup4>=4.4.0'
         'python-pysubs2>=1.7'
         'python-requests>=2.0'
         'python-click>=8.0'
         'python-click-option-group>=0.5.0'
         'python-dogpile.cache>=1.0'
         'python-stevedore>=3.0'
         'python-chardet>=5.0'
         'python-srt>=3.5'
         'python-tomli>=2'
         'python-rarfile>=2.7')
makedepends=('git'
             'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2ed6024a07bbb3c68fe3db76374244ad91adfca9d93fc24d3ddb9ef61825756e')
sha512sums=('cb69fca08a35ba34c07a184bdc42c5b36b54af7b54ddb9a9f4948f8019aebe93ea8e936c8fa89ebf10a974e32b60a8b06c36dd33ea7e73e8aaa2023e83e512da')
b2sums=('79e1a9fe1d71bd7ac28d8a8ae171a1ae6238253fa58fb3bd315aada4b0ea08782b004f011198cdd4d26ce5316340df12f346239ce07c8ae262b8ce5d9de5e148')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -v -m755 -d "${pkgdir}/usr/share/licenses/subliminal"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/subliminal/"
}
