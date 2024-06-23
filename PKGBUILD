# Maintainer : Darshit Shah <git@darnir.net>
#
pkgname=firefly-cli
pkgver=0.2.2
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
md5sums=('4c11b21bc228a510a2873e42852c4277')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
