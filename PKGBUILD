# Maintainer: Taevas <code@taevas.xyz>

pkgname=('python-sourcetypes')
_name=${pkgname#python-}
pkgver='0.0.4'
pkgrel=1
pkgdesc="Python Source Code Types For Inline Syntax Highlighting"
license=('MIT')
arch=('any')
url="https://github.com/samwillis/python-inline-source/tree/main/sourcetypes"
makedepends=('python-setuptools')
depends=('python' 'python-typing_extensions')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a89258eb5a9d7eb40ed9d189c999a4424e48dd9b67e1780869ecbd42ec6ce51c')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    # No LICENSE file is actually provided in the .tar.gz file
    #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
