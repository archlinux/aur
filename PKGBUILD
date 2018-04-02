# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=('in-toto')
pkgver=0.2.2
pkgrel=1
pkgdesc="A framework to secure your software supply chain"
arch=('any')
license=('MIT')
url="https://in-toto.io"
depends=('python-cryptography'
    'python-securesystemslib>=0.10.9'
    'python-iso8601'
    'python-attrs'
    'python-dateutil'
    'python-six')
optdepends=("gnupg: pgp signing/verification")
makedepends=('python' 'python-setuptools')
source=("https://github.com/in-toto/in-toto/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('c4326adb0abf531c7908995c24e13295'
         'SKIP')
sha256sums=('9ff9c9ef9471576e1eeefd14e410f054afce9ee6df3727000ae1d68142a26c83'
            'SKIP')
sha512sums=('7614577830c2dfb1db6c13a98f7b4f75d2900ea7047127df01077b0a14c76385c43c2e321554497be9960f7a09bcd9fd8c42de3d5846f40de60ab357925b4aaa'
            'SKIP')
validpgpkeys=("903BAB73640EB6D65533EFF3468F122CE8162295"
    # Santiago Torres-Arias (upstream co-maintainer)
    "8BA69B87D43BE294F23E812089A2AD3C07D962E8"
    # Lukas Puehringher (upstream maintainer)
    )

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
