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
makedepends=('python-setuptools' 'python-requests' 'python-boto' 'python-bz2file')
source=("https://github.com/RaRe-Technologies/${_pkgbase}/archive/${pkgver}.tar.gz")
md5sums=('df70ebbc44860f299f6a9e3e7f5bef92')


build() {
    cd ${srcdir}/$_pkgbase-${pkgver//_/-}
    python setup.py build
}

package() {
    cd ${srcdir}/$_pkgbase-${pkgver//_/-}
    python setup.py install --prefix=/usr --root=${pkgdir}
}
