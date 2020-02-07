# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname=("python-bearer")
pkgver=3.1.0
pkgrel=1
pkgdesc="Bearer python helper"
arch=("any")
url="https://www.bearer.sh"
license=("MIT")
options=(!emptydirs)
depends=("python" "python-requests")
source=(
    "https://files.pythonhosted.org/packages/1c/1a/6e82d7a52d480450f0e50186b075be7396a12d594c0a91906dcf19ee710d/bearer-3.1.0.tar.gz"
    "https://raw.githubusercontent.com/Bearer/bearer-python/master/LICENSE"
)
sha256sums=(
    "3737cad0010d73890d026df536c7cd4ad0ce0996f86d8356a97848937a4d6a84"
    "5736c527a1ca8f62fc5c760bfd4d91ac36697c04f4d55f9cc81d3c76cc71a8fe"
)

build () {
    cd "$srcdir/bearer-$pkgver"
    python3 setup.py build
}

package () {
    cd "$srcdir/bearer-$pkgver"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

