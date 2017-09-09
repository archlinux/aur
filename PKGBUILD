# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>

_pkgbase=smart_open
pkgbase=python-smart-open
pkgname=('python-smart-open')
pkgver=1.5.3
pkgrel=1
pkgdesc="Utils for streaming large files (S3, HDFS, gzip, bz2...) "
arch=('i686' 'x86_64')
url="https://github.com/RaRe-Technologies/smart_open"
license=('LGPL')
makedepends=('python-setuptools')
depends=(python-requests python-boto python-bz2file)
source=("https://github.com/RaRe-Technologies/${_pkgbase}/archive/${pkgver}.zip")
md5sums=('6d095e7a3c4bb23eec10590a8da814b6')


build() {
    cd ${srcdir}/$_pkgbase-${pkgver//_/-}
    python setup.py build
}

package() {
    cd ${srcdir}/$_pkgbase-${pkgver//_/-}
    python setup.py install --prefix=/usr --root=${pkgdir}
}
