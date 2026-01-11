# Maintainer: Kyle Laker <kyle+aur at laker dot email>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
pkgname='python-click-completion'
_name="${pkgname#python-}"
pkgver='0.5.2'
pkgrel=10
pkgdesc='Add or enhance bash, fish, zsh and powershell completion in Click'
arch=('any')
url='https://github.com/click-contrib/click-completion'
license=('MIT')
depends=('python' 'python-click' 'python-jinja' 'python-six' 'python-shellingham')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4c7b8b3e78124e1005c9f221a2123b6ec02f3942d2be10f79fe3a5c96a52a96c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/python-click-completion/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/python-click-completion/"
}
