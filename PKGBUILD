# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=douban.fm
pkgver=0.4.12
pkgrel=1
pkgdesc="a tiny and smart cli player of douban.fm based on Python"
url="https://github.com/taizilongxu/douban.fm"
depends=('python2' 'python2-termcolor' 'python2-requests' 'python2-pillow' 'mplayer' 'python2-pip')
makedepends=('python2-setuptools')
optdepends=('libnotify: for desktop notification')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/douban.fm/douban.fm-${pkgver}.tar.gz")
md5sums=('9ce066a7d0964bdf72a6a4af18b2890e')

build() {
    cd "${srcdir}/douban.fm-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/douban.fm-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # mv ${pkgdir}/usr/bin/{douban.fm,doubanfm}
}
