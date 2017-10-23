# Maintainer: Lubomir 'The_K' Kucera <lubomir-kucera-jr-at-gmail-dot-com>

_pkgname=beautysh
pkgname=(python-beautysh python2-beautysh)
pkgver=3.6
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/bemeurer/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('8bc1feca179bd8a4b0f7dd2094fa95bc86b7c09407f8286156617eda4cea1a8c')

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
