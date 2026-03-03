# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild | https://aur.archlinux.org/packages/pip2pkgbuild
# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributer: lalala <lalala_233@qq.com>
# Contributer: Ryen Burns <bburns91@gmail.com>
# Contributer: loryeam <loryeam@gmail.com>

pkgbase='python-cs50'
pkgname=('python-cs50')
_module='cs50'
pkgver='9.5.0'
pkgrel=1
pkgdesc="CS50 library for Python"
url="https://github.com/cs50/python-cs50"
# from https://github.com/cs50/python-cs50/blob/7247c92fdb4832a04d510ad0d31f16f9307ae8fa/setup.py#L13
depends=('python' 'python-flask' 'python-packaging' 'python-sqlalchemy' 'python-sqlparse' 'python-termcolor' 'python-wheel')
makedepends=('python-build' 'python-installer')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('0cc8fb9d454f784318a82abd996b7e122c1eb5ea0dd367b5e9b406462066d259')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
