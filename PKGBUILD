# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild | https://aur.archlinux.org/packages/pip2pkgbuild
# Maintainer: Ryen Burns <bburns91@gmail.com>

pkgbase='python-submit50'
pkgname=('python-submit50')
_module='submit50'
pkgver='3.1.1'
pkgrel=1
pkgdesc="This is submit50, with which you can submit solutions to problems for CS50."
url="https://github.com/cs50/submit50"
depends=('python')
makedepends=('python-build' 'python-installer')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('f4656b1b5db4d58344b35635f4bd7db77f158651feae0ebb1a76d528d63fadce')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
