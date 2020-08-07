# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=thank-you-stars
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI tool to star a PyPI package and its dependencies hosted on GitHub'
arch=('any')
url='https://github.com/thombashi/thank-you-stars'
license=('MIT')
depends=('python'
        'python-appconfigpy'
        'python-colorama'
        'python-datetimerange'
        'python-logbook'
        'python-mbstrdecoder'
        'python-msgfy'
        'python-path'
        'python-pathvalidate'
        'python-pygithub'
        'python-pytablewriter'
        'python-retryrequests'
        'python-subprocrunner'
        'python-tqdm')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c5b47fff6dfc82a1699ad4d4a5e0858a38da6abaa47901a69ee6952376df3b4c')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
