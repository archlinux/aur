# Maintainer: redponike <proton (dot) me>

_pkgname=symbolica
pkgname=python-$_pkgname-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="A blazing fast computer algebra system for Python and Rust"
arch=('x86_64')
url="https://github.com/benruijl/symbolica"
license=('LicenseRef:Symbolica')
conflicts=('python-symbolica')
depends=('python')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/cp37/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-cp37-abi3-manylinux_2_17_$arch.manylinux2014_$arch.whl"
        "https://raw.githubusercontent.com/benruijl/symbolica/refs/heads/main/License.md"
)
sha256sums=('24a88663060ac6406bade1f0114a86bb46a3c46fba99f74e3bee988f04138ea3'
            'bd67a2ee0db093b675b8fa112908c96b792b104d1d7656ba93224d2ed1e6eccd')

package() {
    python -m installer --destdir="$pkgdir" *.whl
    install -Dm 644 License.md "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
