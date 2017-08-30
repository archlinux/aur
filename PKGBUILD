# Maintainer: Lubomir 'The_K' Kucera <lubomir-kucera-jr-at-gmail-dot-com>

_pkgname=beautysh
pkgname=(python-beautysh python2-beautysh)
pkgver=3.3
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/bemeurer/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('e6f2d3e7a77a1c47096870451e2dcc9b09e450c335a19b31959c8f92e0b49e7a')

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
