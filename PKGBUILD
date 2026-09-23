pkgname=degourou
pkgver=1.3.9
pkgrel=3
pkgdesc="Automate the process of getting decrypted ebook from InternetArchive without the need for Adobe Digital Editions and Calibre"
url="https://pypi.org/project/DeGourou/"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python-pycryptodomex' 'python-lxml' 'python-cryptography' 'python-charset-normalizer' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/d1/b4/0280d7aa60c0fe4279ee3334bcc6c3e3464418b9b0e2702daabcea2d7d5f/DeGourou-${pkgver}.tar.gz")
sha256sums=('d0b6eb7a9ead023bde8f5266e803aa33ace7cbb11c1952fe1558ca667bbae9c8')

build() {
    cd "$srcdir/DeGourou-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/DeGourou-${pkgver}"
    # copy files
    python setup.py install --root="$pkgdir" --optimize=1
}
