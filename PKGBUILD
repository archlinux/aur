# Maintainer : Darshit Shah <git@darnir.net>
#
pkgname=firefly-cli
pkgver=0.1.2
pkgrel=1
pkgdesc="A python-based command line interface for practically entering expenses in Firefly III"
url="https://github.com/afonsoc12/firefly-cli"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python' 'python-attrs' 'python-certifi' 'python-charset-normalizer' 'python-cmd2' 'python-idna'
'python-pyperclip' 'python-requests' 'python-wcwidth'
'python-tabulate' 'python-urllib3' 'python-pyxdg')

# makedepends=('python-distribute')
source=("https://github.com/afonsoc12/firefly-cli/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6f8470ac00dcf5a345cebb25d50ea5ef')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
