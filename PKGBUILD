# Maintainer: Joffrey <j-off@live.fr>

_name='django-ranged-response'
pkgname="python-$_name"
pkgver=0.2.0
pkgrel=3
pkgdesc='Django ranged response'
arch=('any')
url="https://pypi.org/project/_name"
license=('MIT')
depends=('python-django')
makedepends=('python-setuptools')
source=(
    "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
    'LICENSE'
)
sha256sums=(
    'f71fff352a37316b9bead717fc76e4ddd6c9b99c4680cdf4783b9755af1cf985'
    '5e47e2a8ca47cda5a311fea4e29186201e6f980fc20d24812596460d289a8275'
)

package() {
    cd "$srcdir/$_name-$pkgver"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
