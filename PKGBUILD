pkgname='python-borgstore'
_module='borgstore'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Borg Backup'\''s backend key/value store'
url='https://github.com/borgbackup/borgstore/'
depends=(
        'python>=3.12'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
)
license=('BSD-3-Clause')
arch=('any')
source=("${url}/releases/download/${pkgver}/${_module}-${pkgver}.tar.gz")
b2sums=('31f4a5b26898e6e056a8447f9c8b451f3caae10f96009f3f88c20d0bcfa104d5e200ea4ffe78d4534495f834f98f2025dac6f82bb2e8293731bb9d56776cba83')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
