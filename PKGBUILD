pkgname=python312-pre-commit
pkgver=4.6.0
pkgrel=1
pkgdesc='Framework for managing and maintaining multi-language pre-commit hooks for Python 3.12'
arch=('any')
url='https://github.com/pre-commit/pre-commit'
license=('MIT')
depends=(
  'git'
  'python312'
  'python312-cfgv'
  'python312-identify'
  'python312-nodeenv'
  'python312-pyyaml'
  'python312-virtualenv'
)
makedepends=('python312-installer')
source=("pre_commit-4.6.0-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/80/6e/4b28b62ecb6aae56769c34a8ff1d661473ec1e9519e2d5f8b2c150086b26/pre_commit-4.6.0-py2.py3-none-any.whl")
sha256sums=('e2cf246f7299edcabcf15f9b0571fdce06058527f0a06535068a86d38089f29b')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/pre_commit-4.6.0-py2.py3-none-any.whl"

  # Avoid conflicting with Arch's pre-commit package, which owns /usr/bin/pre-commit.
  rm -f "$pkgdir/usr/bin/pre-commit"
  rmdir --ignore-fail-on-non-empty "$pkgdir/usr/bin"
}
