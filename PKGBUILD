# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgbase='python-pymkv'
pkgname=('python-pymkv')
_module='pymkv'
pkgver='1.0.5'
pkgrel=1
pkgdesc="A Python wrapper for mkvmerge that provides support for muxing, splitting, linking, chapters, tags, and attachments."
url="https://github.com/sheldonkwoodward/pymkv"
depends=('python' 'mkvtoolnix-cli' 'python-iso639' 'python-bitmath')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('12942c3af5cf8c5b2fede3318e84b7f339f1e12a3ea316a632ad16223c592e42')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licences/${pkgname}/LICENSE.txt"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
