# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild | https://aur.archlinux.org/packages/pip2pkgbuild
# Maintainer: Matthias Mailänder <matthias@mailaender.name>
# Contributor: Ryen Burns <bburns91@gmail.com>

pkgbase='python-submit50'
pkgname=('python-submit50')
_module='submit50'
pkgver='3.2.0'
pkgrel=2
pkgdesc="This is submit50, with which you can submit solutions to problems for CS50."
url="https://github.com/cs50/submit50"
depends=('python' 'python-lib50' 'python-pytz' 'python-requests' 'python-termcolor' 'python-jellyfish')
makedepends=('python-build' 'python-installer')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('bc0d654f824a2924690b0b4e4f0f667d7a891cf76108727b78cd2052ea73c1e4')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
