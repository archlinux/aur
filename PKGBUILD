# Maintainer: Kyle Laker <kyle+aur at laker dot email>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
pkgname='python-click-completion'
_name="${pkgname#python-}"
pkgver='0.5.1'
pkgrel=2
pkgdesc='Fish, Bash, Zsh, and PowerShell completion for Click.'
arch=('any')
url='https://github.com/click-contrib/click-completion'
license=('MIT')
depends=('python' 'python-click' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('78072eecd5e25ea0d25ceaf99cd5f22aa2667d67231ae0819deab9b1ff3456fb')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
