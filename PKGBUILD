# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_name=iOSbackup
pkgname=python-iosbackup
pkgver=0.9.921
pkgrel=1
pkgdesc='Library for reading and extracting files from password-encrypted iOS backups'
arch=(any)
url='https://github.com/avibrazil/iOSbackup'
license=('LGPL')
depends=('python' 'python-nskeyedunarchiver' 'python-pycryptodome')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('1068c3e4f8c439361c297d2e715905390362861f18a7eef64f3270e6e0897cea8a207368084f3535eba35da3b29dead9064172e0255d5bf0944b7eb9db3e84bc')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
