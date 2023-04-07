# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=docutils-stubs
pkgname=python-$_pkgname
pkgver=0.0.22
pkgrel=2
pkgdesc='PEP 561 based Type information for docutils'
arch=('any')
url='https://github.com/tk0miya/docutils-stubs'
license=('custom:Unlicense')
depends=('python' 'python-docutils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/tk0miya/docutils-stubs/1f13dcdbebb06bc742b797bc5765a70d734a7fbc/LICENSE')
sha512sums=('30aeac0f15c215abdb6eb42e0bf46e50f08f20befc7bebd7fa376e7f85813189ab71df583231c461539530b1d7da6fc263d75b24ff251c46d2dcb3163bd0116b'
            'f23a3f3ec79340594ea40d731087e8586326a96c6cb9675c7a58687255885148286aa73cee087a5a3c976ea901fde16e229d00e98c65188cce3f0d75c8390a10')

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
