# Mantainer: redponike <proton (dot) me>

_pkgname=auditwheel
pkgname="python-$_pkgname-bin"
pkgver=6.3.0
pkgrel=1
pkgdesc="Auditing and relabeling cross-distribution Linux wheels. (Binary/wheel package)"
arch=('x86_64')
url="https://github.com/pypa/auditwheel"
license=('MIT' 'BSD')  # MIT with pax-utils on BSD
conflicts=('python-auditwheel')
depends=('python')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/pypa/auditwheel/refs/heads/main/LICENSE"
)
sha256sums=('31cbd8045d4ff6776f79bef328b5fd563e5ecc8ae82ea34b6fe5e76efe2a84eb'
            '6c82c42d1770fe7595c526882efe6dd28bcde32a1079be369d6d6bd73b653f9b')

package() {
    python -m installer --destdir="$pkgdir" *.whl
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
