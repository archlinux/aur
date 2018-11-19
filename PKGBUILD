# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=nwdiag
pkgver=1.0.4
pkgrel=3
pkgdesc="Generate network-diagram image files from spec-text files."
arch=(any)
url="http://blockdiag.com/en/nwdiag"
license=(APACHE)
depends=('python'
         'blockdiag>=1.5.0'
         'python-funcparserlib')
optdepends=('python-reportlab: to use the PDF output format'
            'python-docutils: to use the RST output format')
makedepends=(python-distribute)
changelog=Changelog
conflicts=('nwdiag-hg')
source=("https://pypi.python.org/packages/source/n/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0d2ff1348aeff53aaf08838d0fa2c001')
sha1sums=('501c4a07f559cfd78b8f49b6949d79c2464b8818')
sha256sums=('002565875559789a2dfc5f578c07abdf44269c3f7cdf78d4809bdc4bdc2213fa')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
