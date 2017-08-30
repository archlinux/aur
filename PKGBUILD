# Maintainer: Lubomir 'The_K' Kucera <lubomir-kucera-jr-at-gmail-dot-com>

_pkgname=beautysh
pkgname=(python-beautysh python2-beautysh)
pkgver=3.1
pkgrel=3
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/bemeurer/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('24934fea36ae6001342afbe79dbc3efe33c0dab7cae278f3925dd0edc246221a')

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
