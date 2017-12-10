# Maintainer: Ľubomír 'The_K' Kučera <lubomir.kucera.jr at gmail.com>

_pkgname=beautysh
pkgname=(python-beautysh python2-beautysh)
pkgver=3.7
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/bemeurer/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('77166d1fd13b64c9afd0c33895a9af836f14331fbd564cc64bba3e8f59172132')

package_python-beautysh() {
    depends=('python')

    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-beautysh() {
    depends=('python2')

    cd "${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}"/usr/bin/beautysh{,2}
}
