# Maintainer: Kyle Laker <kyle+aur at laker dot email>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
pkgname='python-click-completion'
_name="${pkgname#python-}"
pkgver='0.5.1'
pkgrel=1
pkgdesc='Fish, Bash, Zsh, and PowerShell completion for Click.'
arch=('any')
url='https://github.com/click-contrib/click-completion'
license=('MIT')
depends=('python' 'python-click' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('7d84eaca50f78ce1abfb485d3d63c3625d1454ae54c86eeebf03e5aeb8fcbb1f3afcac8202b1c44549aaecb2fc480491a5ce082bec30b1cab9e731acc1875cc2')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
