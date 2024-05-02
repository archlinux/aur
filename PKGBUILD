# Maintainer: Shae VanCleave <shae.m.vc@proton.me>

pkgname='caustic-parser'
pkgdesc="Caustic's Parser--CLI (cap) and Python package"
url='https://codeberg.org/Caustic/CausticParser'
license=('Apache-2.0')

groups=('caustic')

pkgver=3.0.0
pkgrel=1

arch=('any')
depends=('python' 'python-parglare' 'caustic-cst')
makedepends=('python-installer')
optdepends=('caustic-grammar: default/builtin grammar'
            'python-click: required for the cap CLI command')

source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname//-/.}/${pkgname//-/.}-$pkgver-py3-none-any.whl")
noextract=("${pkgname//-/.}-$pkgver-py3-none-any.whl")
sha256sums=('8c4faac75dc0d1b0bef23e360bcd148720e1d86b11448d94f1f3aa71703ade48')


package() {
    python -m installer --destdir="$pkgdir" "${pkgname//-/.}-$pkgver-py3-none-any.whl"
}
